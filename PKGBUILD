# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Tung Ha <tunght13488[at]gmail[dot]com>

pkgname=ios-webkit-debug-proxy
pkgver=1.9.0
pkgrel=2
pkgdesc="DevTools proxy (WebKit Remote Debugging) for iOS devices (Safari Remote Web Inspector)"
url="https://github.com/google/ios-webkit-debug-proxy"
arch=('i686' 'x86_64')
license=('BSD-3-Clause')
depends=('libimobiledevice')
source=("https://github.com/google/ios-webkit-debug-proxy/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
        "https://github.com/google/ios-webkit-debug-proxy/commit/5ba30a2a67f39d25025cadf37c0eafb2e2d2d0a8.patch"
        "https://github.com/google/ios-webkit-debug-proxy/commit/94e4625ea648ece730d33d13224881ab06ad0fce.patch")
sha256sums=('ba9bb2feaa976ad999e9e405d8cd8794cdf3546130a79f4785235200ead3c96c'
            '5a499ee2cebf64fe3a75683ff8245948345b64acdc946abaa693a62bb146f7d2'
            '5dea08f3f0fac8f5d1a0014ab404da386120f192d5ed14f9e231afe7ef1a2208')
prepare() {
	cd ios-webkit-debug-proxy-$pkgver
	patch -p1 -i ../5ba30a2a67f39d25025cadf37c0eafb2e2d2d0a8.patch
	patch -p1 -i ../94e4625ea648ece730d33d13224881ab06ad0fce.patch
}

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
