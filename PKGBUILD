# Maintainer: Icarus Mitchellson <mumei AT airmail DOT cc>

pkgname=timemon.app
_pkgname=TimeMon
pkgrel=1
pkgver=4.2
pkgdesc="An abstract graphical representation of where your CPU cycles are going."
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/timemon/index.html"
license=('GPL')
groups=('gnustep')
depends=('gnustep-base' 'gnustep-gui')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('3204e7cc454db233cebb93bb7cc8ad56bf5754063ed7be1a765051615a04ec0f')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -D -m644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" \
    "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
