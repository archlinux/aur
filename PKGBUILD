# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=edenmath.app
_pkgname=EdenMath
pkgrel=1
pkgver=1.1.1
pkgdesc="Scientific calculator originally written for Mac OSX & ported to GNUstep"
arch=('i686' 'x86_64')
url="https://www.eskimo.com/~pburns/EdenMath/files/EdenMath_GNUstep-1.1.1.tar.gz"
license=('GPL')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("https://www.eskimo.com/~pburns/EdenMath/files/EdenMath_GNUstep-1.1.1.tar.gz")
sha256sums=('fb149a898bae0f08cb86efa388f2847c1ddfe6a6738f4ee6de7eeaa2c9cc444f')

build() {
  cd "EdenMath_GNUstep-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "EdenMath_GNUstep-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
