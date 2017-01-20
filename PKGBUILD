# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ios-webkit-debug-proxy
pkgver=1.7.1
pkgrel=1
pkgdesc="DevTools proxy (WebKit Remote Debugging) for iOS devices (Safari Remote Web Inspector)"
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libimobiledevice')
source=("https://github.com/google/ios-webkit-debug-proxy/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('56416febf6535b22f2552db7489ce90517f9a642732e1c1e6722377bf13c6f6a')

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
