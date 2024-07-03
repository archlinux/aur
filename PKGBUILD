# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Tung Ha <tunght13488[at]gmail[dot]com>

pkgname=ios-webkit-debug-proxy
pkgver=1.9.1
pkgrel=1
pkgdesc="A DevTools proxy (Chrome Remote Debugging Protocol) for iOS devices (Safari Remote Web Inspector)."
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD-3-Clause')
depends=('glibc' 'libimobiledevice' 'libplist' 'libusbmuxd' 'openssl')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6b7781294cc84d383c7e7ecd05af08ca8d9b2af7a49ba648178ae4d84837c52b')

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
