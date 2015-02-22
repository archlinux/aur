# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: demonicmaniac <demonicmaniac@gmx.net>
# Contributor: TheGuy <lowelink26381@gmail.com>
# Contributor: Nicolas Hureau <archlinux@kalenz.fr>

pkgname=libgba
pkgver=20150106
_pkgverexamples=20090222
pkgrel=1
pkgdesc="Library for Nintendo Gameboy Advance homebrew development"
arch=('any')
url="http://www.devkitpro.org"
license=('GPL' 'LGPL')
depends=('devkitarm')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2"
        "http://downloads.sourceforge.net/sourceforge/devkitpro/gba-examples-$_pkgverexamples.tar.bz2")
sha256sums=('b74bfe25e98141caa6bb53de59d43ccb77da3139b78cf1c7a287d1ca237a2cd7'
            '10759af863d4222857f98867571b8f5bf4328d44446c7b4384cd3f029bc10753')
noextract=("gba-examples-$_pkgverexamples.tar.bz2")

build() {
  source /etc/profile.d/devkitarm.sh
  make
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  make install
  # examples
  install -d "$DEVKITPRO"/examples/gba
  bsdtar -x -f gba-examples-$_pkgverexamples.tar.bz2 -C "$DEVKITPRO"/examples/gba
  # fix permissions
  chown -R root:root "$DEVKITPRO"/examples
  find "$DEVKITPRO"/examples -type d -exec chmod +rx "{}" \+
  # license
  install -Dm644 libgba_license.txt "$pkgdir"/usr/share/licenses/libgba/libgba_license.txt
}
