pkgname="lightgbm"
pkgver="4.6.0"
pkgrel="2"
pkgdesc="A fast, distributed, high performance gradient boosting (GBT, GBDT, GBRT, GBM or MART) framework based on decision tree algorithms, used for ranking, classification and many other machine learning tasks."
arch=("aarch64" "x86_64")
url="https://github.com/microsoft/LightGBM"
license=("MIT")
options=("!debug")

optdepends=()
depends=()
makedepends=("cmake" "gcc")
source=(
	"git+${url}.git#tag=v${pkgver}"
)
sha256sums=(
	"1e2c2e8ebe9acb8b730e7ca56efddee3ee6bf11d2674efccf4bb27673e1529c0"
)

prepare() {
	cd ${srcdir}/LightGBM/

	git submodule init
	git submodule update --init
}

build() {
	cd ${srcdir}/LightGBM/

	cmake -DCMAKE_INSTALL_PREFIX=/usr -B build -S .
	cmake --build build -j4
}

package() {
	cd ${srcdir}/LightGBM/

	DESTDIR="$pkgdir" cmake --install build

	mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}/
	cp ${srcdir}/LightGBM/LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/
}
