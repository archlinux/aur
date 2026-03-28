# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname='python-flashinfer-rocm'
_pkgname='flashinfer'
pkgver=0.5.3
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
	"${url}/archive/refs/tags/v${pkgver}+amd.1.tar.gz"
)
sha256sums=(
	'c6b72c9e37627bcb3f34b3d7f488f5754320c99d081bfc53e457df9aac39cc7f'
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
