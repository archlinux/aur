# Maintainer: SteamedFish <steamedfish@hotmail.com>
# Contributor: SingYan <singyan@tuta.io>

pkgname=mydumper
pkgver=0.15.2_6
pkgrel=1
pkgdesc="A high performance MySQL backup tool."
arch=("i686" "x86_64")
url="https://github.com/maxbube/mydumper"
license=('GPL')
depends=("glib2" "libmariadbclient" "pcre" "pcre2" "openssl")
makedepends=("cmake")

source=("https://github.com/maxbube/mydumper/archive/v${pkgver//_/-}/$pkgname-${pkgver//_/-}.tar.gz")

sha256sums=('66af880dfa3218d4f0cd65be903ec2cf3bb02193efd5d54600e408dd7835371a')

build() {
	cmake -B build -S "$srcdir/$pkgname-${pkgver//_/-}" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	make -C build VERBOSE=1
}

package() {
	make -C build DESTDIR="$pkgdir" install
}
