# Maintainer: <mumei AT airmail DOT cc>

pkgname=grr.app
_pkgname=Grr
pkgrel=1
pkgver=1.0
pkgdesc="An Rss reader for GNUstep and Macintosh"
arch=('i686' 'x86_64')
url="http://www.nongnu.org/gap/grr/index.html"
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'rsskit')
makedepends=('gcc-objc' 'gnustep-make')
source=("http://savannah.nongnu.org/download/gap/$_pkgname-$pkgver.tar.gz")
sha256sums=('62537cf73b2604cafe541e7cb5cb7eabb0b5da9e43662737efaa7676336a9994')

build() {
  cd "$_pkgname-$pkgver"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}
package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}