# SPDX-License-Identifier: BSD-2-Clause
# Maintainer: Aki-nyan <aur@catgirl.link>

_pkgname="torii-sim-wasm"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=2
pkgdesc="A WASM based simulation backend for Torii"
arch=("aarch64" "armv7" "ppc64le" "x86" "x86_64")
url="https://github.com/shrine-maiden-heavy-industries/torii-sim-wasm"
license=("BSD-2-Clause")
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git" "${pkgname}-nightly")
depends=(
	"python>=3.11" "python<4.0"
	"python-torii>=0.8.1" "python-torii<1.0"
	"python-pyvcd>=0.4.0" "python-pyvcd<0.5.0"
)
makedepends=(
	"rust"
	"cargo"
	"maturin"
	"python>=3.11" "python<4.0"
	"python-maturin"
	"python-build"
	"python-installer"
	"python-setuptools-scm"
	"python-setuptools>=66"
	"python-wheel"
)
optdepends=(
	"gtkwave: Simulation trace viewing"
	"surfer-waveform: Simulation trace viewing"
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
)
sha256sums=(
	"409b3e9e742f3c80618b690853ed78bedcbdea165abfb9b9311b631225b821ca"
)

build() {
	cd "${_pkgname//-/_}-${pkgver}"

	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname//-/_}-${pkgver}"

	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
