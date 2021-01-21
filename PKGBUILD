# Maintainer: Tung Ha <tunght13488[at]gmail[dot]com>

pkgname=ios-webkit-debug-proxy
pkgver=1.8.8
pkgrel=1
pkgdesc="DevTools proxy (WebKit Remote Debugging) for iOS devices (Safari Remote Web Inspector)"
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD')
depends=('libimobiledevice')
source=("https://github.com/google/ios-webkit-debug-proxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('5b743276f7fbcd145e6212e892867304c5e49e7c75c0f4a331ec6deb6a8d5b3e')

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
