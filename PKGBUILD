# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
# Maintainer: Scott K Logan <logans@cottsay.net>
pkgname=openelp
pkgver=0.9.2
pkgrel=1
pkgdesc="Open source EchoLink Proxy"
arch=('x86_64')
url="https://github.com/cottsay/openelp"
license=('BSD')
depends=(pcre2)
makedepends=(cmake)
backup=(etc/ELProxy.conf)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('1427a2fe6f22856a66b9c687d7f14b7915abeeed64951ae596084f9366ec4256')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake .. -DCMAKE_INSTALL_PREFIX="/usr" \
		-DSYSCONF_INSTALL_DIR:PATH="/etc"
	make
}

check() {
	cd "$pkgname-$pkgver/build"
	make -k check
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$pkgver/LICENSE"
}
