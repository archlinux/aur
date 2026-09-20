# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname='python-flashinfer-rocm'
_pkgname='flashinfer'
pkgver=0.6.18
pkgrel=1
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
	'adf4c28b6e0a8a19410cd9060994e485b21577119459df5acdee29dd312d5a37'
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
