# Maintainer: fedefranc <ffaur-at-duck-dot-com>
# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SingYan <singyan@tuta.io>

pkgname=mydumper
pkgver=0.21.1_1
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/mydumper/mydumper"
license=('GPL-3.0-or-later')
depends=("glibc" "glib2" "mariadb-libs" "pcre2")
makedepends=("cmake")

source=("https://github.com/mydumper/mydumper/archive/v${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")

sha256sums=('5fcfc9ba0c031b090eb1c3a2f018a4ee82364b3441cb355fe1c810767cb071ec')

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
