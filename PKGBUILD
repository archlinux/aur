# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof
pkgver=6.1
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=(gcc-libs)
makedepends=(cmake ninja gcc tclap gzip)
provides=(sof)
conflicts=()
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=("740147e9db1853382520b4790b757be82232e88326f485933ab16b173e56d8b3")

package() {
		cd ./sof
		cmake --preset release \
				-DCMAKE_CXX_COMPILER=g++ \
				-DVERSION=${pkgver}
		cmake --build --preset release
		DESTDIR="$pkgdir" cmake --install ./build/release-Linux/ --prefix=/usr

		install -Dm644 ./COPYING ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
