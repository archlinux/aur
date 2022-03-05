# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: fatalis <fatalis@fatalis.pw>

pkgname=libsubhook
pkgver=0.8.2
pkgrel=2
pkgdesc='Simple hooking library for C/C++'
arch=('x86_64')
url='https://github.com/Zeex/subhook'
license=('BSD')
depends=('glibc')
makedepends=('cmake')
provides=('libsubhook.so')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('ec90dae3549d73e275a6c84356d4cefc2a21b82061cfdc0833cf0866038e9917')

build() {
	cmake \
		-B build \
		-S "subhook-$pkgver" \
		-DCMAKE_BUILD_TYPE='None' \
		-DCMAKE_INSTALL_PREFIX='/usr' \
		-DSUBHOOK_TESTS=0 \
		-Wno-dev
	make -C build
}

package() {
	DESTDIR="$pkgdir" make -C build install
	cd "subhook-$pkgver"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
