# Maintainer: <mumei AT airmail DOT cc>

_pkgname=PRICE
pkgname=price.app
pkgrel=1
pkgver=1.3.0
pkgdesc='High quality image viewing, filtering and enhancement application for GNUstep and MacOS'
arch=('i686' 'x86_64' 'armv7h')
url='http://price.sourceforge.net/'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://sourceforge.net/projects/price/files/1.3.0/PRICE-1.3.0.tar.gz/download")
sha256sums=('464bca113731023b43949992456cfa054f2d0fa3e1c5e7b5ca399f3f6f0af49b')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
