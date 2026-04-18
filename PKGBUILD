# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname='python-flashinfer-rocm'
_pkgname='flashinfer'
pkgver=0.5.3
pkgrel=2
arch=('x86_64')
pkgdesc='ROCm port of FlashInfer (CDNA3+)'
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
	python-build
	python-setuptools-scm
	python-scikit-build-core
	cmake
	rocm-hip-sdk
	python-installer
)
optdepends=(
	python-click
	python-tvm-ffi
)

source=(
	"${url}/archive/refs/tags/v${pkgver}+amd.${pkgrel}.tar.gz"
)
sha256sums=(
	'f83eb02af3cbec2c757a093a7b308dd814b5e6901dcc2308070a4b3172ec9f76'
)

prepare() {
	cd ${_pkgname}-${pkgver}-amd.${pkgrel}
#	cmake -B build .
}

build() {
	cd ${_pkgname}-${pkgver}-amd.${pkgrel}
	python3 -m build -wn
}

package() {
	cd ${_pkgname}-${pkgver}-amd.${pkgrel}
	python3 -m installer --prefix ${pkgdir}/usr/ dist/*whl
}
