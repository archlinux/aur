# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname='python-flashinfer-rocm'
_pkgname='flashinfer'
pkgver=0.3.1
pkgrel=1
arch=('x86_64')
pkgdesc='ROCm port of FlashInfer'
url="https://github.com/ROCm/flashinfer"
license=('Apache-2.0')
provides=('python-flashinfer')
depends=(
	python-pytorch
	rocm-hip-runtime
)

makedepends=(
	git
	ninja
	python-scikit-build-core
	cmake
	rocm-hip-sdk
)
optdepends=(
	python-click
	python-tvm-ffi
)

source=(
	"${url}/archive/refs/tags/v${pkgver}+amd.1.tar.gz"
)
sha256sums=(
	'ebc477110fac045d088b69bd64ceaf63cb28585af579548c60d23ee61048fe61'
)

prepare() {
	cd ${_pkgname}-${pkgver}-amd.${pkgrel}
#	cmake -B _skbuild .
}

build() {
	cd ${_pkgname}-${pkgver}-amd.${pkgrel}
	python3 -m build -wn
}

package() {
	cd ${_pkgname}-${pkgver}-amd.${pkgrel}
	python3 -m installer --prefix ${pkgdir}/usr/ dist/*whl
}
