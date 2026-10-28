# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname='python-flashinfer-rocm'
_pkgname='flashinfer'
pkgver=0.6.18
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
	'67d0ce8737fb048a5d0df93bd5420b8d5047870fd66e2742e39c891954ba7394'
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
