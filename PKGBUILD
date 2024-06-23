# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=6.0
pkgrel=5
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=(gcc-libs)
makedepends=(cmake ninja gcc tclap gzip)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("aaf24866ae75dac3635603da9a54f78918d6e59392f20ee8f9879e2c61935f0f")

package() {
		cd ./sof
		cmake -Bbuild -G Ninja \
				-DCMAKE_BUILD_TYPE=Release \
				-DCMAKE_CXX_COMPILER=g++ \
				-DVERSION=${pkgver}
		cmake --build ./build
		DESTDIR="$pkgdir" cmake --install ./build --prefix=/usr

		install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
