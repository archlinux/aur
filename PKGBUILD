# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Tung Ha <tunght13488[at]gmail[dot]com>

pkgname=ios-webkit-debug-proxy
pkgver=1.9.2
pkgrel=1
pkgdesc="A DevTools proxy (Chrome Remote Debugging Protocol) for iOS devices (Safari Remote Web Inspector)."
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD-3-Clause')
depends=('glibc' 'libimobiledevice' 'libplist' 'libusbmuxd' 'openssl')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('768f101612bf5d2507957f10a8e34e98675ea8fe3c63b8ed78772f8abd103fbf')

build() {
	cd ios-webkit-debug-proxy-$pkgver
	./autogen.sh --prefix=/usr
	./configure LIBS="-lm" --prefix=/usr
	make
}

package() {
	cd ios-webkit-debug-proxy-$pkgver
	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.md
}
