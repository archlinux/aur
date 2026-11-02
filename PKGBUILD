# Maintainer: fedefranc <ffaur-at-duck-dot-com>
# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SingYan <singyan@tuta.io>

pkgname=mydumper
pkgver=1.0.13_1
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/mydumper/mydumper"
license=('GPL-3.0-or-later')
depends=("glibc" "glib2" "mariadb-libs" "pcre2")
makedepends=("cmake")

source=("https://github.com/mydumper/mydumper/archive/v${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")

sha256sums=('5b9a79e65dd252672b77c0424a479212df9ad71d807a0ea9d82fcb032bcaec5c')

build() {
	cmake -B build -S "$srcdir/$pkgname-${pkgver//_/-}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_POLICY_VERSION_MINIMUM=3.5

	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
