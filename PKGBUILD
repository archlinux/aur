# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ios-webkit-debug-proxy
pkgver=1.8.2
pkgrel=1
pkgdesc="DevTools proxy (WebKit Remote Debugging) for iOS devices (Safari Remote Web Inspector)"
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libimobiledevice')
source=("https://github.com/google/ios-webkit-debug-proxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1d80a858343539fbb18bf7031df4a032c63792db3e0ec0fa37e1f6cc254e1f6d')

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
