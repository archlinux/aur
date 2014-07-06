# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>

pkgname=maxmod
pkgver=1.0.9
pkgrel=1
pkgdesc="A complete music and sound solution library for NDS and GBA"
arch=('any')
url="http://devkitpro.org/maxmod.org/"
license=('custom')
depends=('devkitarm')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('4c950e99a38ddacd3e33330dc9e117e7db40bb51c0e57f2efc9729dd5517db7f')

build() {
  source /etc/profile.d/devkitarm.sh
  make gba ds7 ds9
}

package() {
  export DEVKITPRO="$pkgdir/opt/devkitpro"

  install -d "$DEVKITPRO"/lib{gba,nds}/{include,lib}
  make install-gba install-nds
  # license
  install -Dm644 maxmod_license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
