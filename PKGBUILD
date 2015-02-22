# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Gerardo Marset <gammer1994@gmail.com>
# Contributor: Aaron Lindsay <aerial9@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>
# Contributor: Alain

pkgname=libfat-nds
pkgver=1.0.14
pkgrel=1
pkgdesc="Library for accessing FAT filesystems from Nintendo DS homebrew"
arch=('any')
url="http://chishm.drunkencoders.com/libfat/"
license=('custom')
depends=('libnds')
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/libfat-src-$pkgver.tar.bz2")
sha256sums=('bfa7768d9a199b2a93e8aacf010f73df59bb7d029df95b7d176a83d9131d20cc')
options=(!strip staticlibs)

build() {
  source /etc/profile.d/devkitarm.sh
  make nds-release
}

package() {
  export DEVKITPRO="$pkgdir"/opt/devkitpro

  install -d "$DEVKITPRO"/libnds/{lib,include}
  make nds-install
  # license
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  head -n 30 include/fat.h > "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
