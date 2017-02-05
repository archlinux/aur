# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Schnouki <thomas.jost@gmail.com>
# Contributor: Vithon <ratm@archlinux.us>

pkgname=maxmod
pkgver=1.0.10
pkgrel=1
pkgdesc="A complete music and sound solution library for Nintendo NDS and GBA homebrew"
arch=('any')
url="http://devkitpro.org"
license=('custom')
depends=('devkitarm')
options=(!strip staticlibs)
source=("http://downloads.sourceforge.net/sourceforge/devkitpro/$pkgname-src-$pkgver.tar.bz2")
sha256sums=('540f1f05e6139b6a2952640059c26bd07a73daf59cd8a1d524a13b7558a06070')

build() {
  # set environment
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
