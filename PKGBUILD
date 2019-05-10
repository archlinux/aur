# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ios-webkit-debug-proxy
pkgver=1.8.4
pkgrel=1
pkgdesc="DevTools proxy (WebKit Remote Debugging) for iOS devices (Safari Remote Web Inspector)"
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libimobiledevice')
source=("https://github.com/google/ios-webkit-debug-proxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('4e919a4d3dae329e3b4db7bfb2bd1b22c938fa86d59acaa6e99ef4eb65793dae')

build() {
	cd ios-webkit-debug-proxy-$pkgver
	./autogen.sh --prefix=/usr
	./configure LIBS="-lm" --prefix=/usr \
	            --includedir=/usr/include/ios-webkit-debug-proxy
	make
}

package() {
	cd ios-webkit-debug-proxy-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
