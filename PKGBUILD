# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=openelp
pkgver=0.8.0
pkgrel=1
pkgdesc="Open source EchoLink Proxy"
arch=('x86_64')
url="https://github.com/cottsay/openelp"
license=('BSD')
depends=(pcre2)
makedepends=(cmake)
backup=(etc/ELProxy.conf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
md5sums=('6c53dd1fc35c330d3f970122fd91849c')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX="$pkgdir/usr"
	make
}

check() {
	cd "$pkgname-$pkgver/build"
	make -k check
}

package() {
	cd "$pkgname-$pkgver/build"
	make install
	install -Dt "$pkgdir/etc/" "$pkgdir/usr/etc/ELProxy.conf"
	rm -r "$pkgdir/usr/etc"
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$pkgver/LICENSE"
}
