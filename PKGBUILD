# Maintainer: Scott K Logan <logans@cottsay.net>
# Maintainer: Steven! Ragnarök <steven@nuclearsandwich.com>
pkgname=createrepo-agent
pkgver=0.4.2
pkgrel=1
pkgdesc="Rapidly and repeatedly generate RPM repository metadata"
arch=('x86_64')
url="https://github.com/osrf/createrepo-agent"
license=('Apache')
depends=(createrepo_c glib2 gpgme libassuan libgpg-error)
makedepends=(cmake gtest)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('a32fa09a8daa42f7146f8c9b4247aa19b80678115ea0b51864dcc8c33b970dc6')

build() {
	cd "$pkgname-$pkgver"
	mkdir build && cd build
	cmake \
		-DCMAKE_INSTALL_PREFIX="/usr" \
		..
	make
}

check() {
	cd "$pkgname-$pkgver/build"
	make -k test
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
	install -Dt "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname-$pkgver/LICENSE"
}
