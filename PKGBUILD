# SPDX-License-Identifier: BSD-2-Clause
# Maintainer: Aki-nyan <aur@catgirl.link>

_pkgname="torii-ila"
pkgname="python-${_pkgname}"
pkgver=0.2.0
pkgrel=1
pkgdesc="Integrated Logic Analyzer core for Torii based designs"
arch=("any")
url="https://github.com/shrine-maiden-heavy-industries/torii-ila"
license=("BSD-3-Clause")
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git" "${pkgname}-nightly")
depends=(
	"python>=3.11" "python<4.0"
	"python-torii>=${pkgver}" "python-torii<1.0"
	"python-pyvcd>=0.4.0" "python-pyvcd<0.5.0"
)
makedepends=(
	"python-build"
	"python-installer"
	"python-pip"
	"python-setuptools-scm"
	"python-setuptools>=66"
	"python-wheel"
)
optdepends=(
	"gtkwave: Simulation trace viewing"
	"surfer-waveform: Simulation trace viewing"
	"python-torii-usb: USB ILA support"
)
source=(
	"${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname//-/_}/${_pkgname//-/_}-${pkgver}.tar.gz"
)
sha256sums=(
	"f1c1456c3fe923c038ff65f50449e8728f3da10a53176a70f6f3ea72d6e65c4d"
)

build() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Build the core Torii ILA wheel
	SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}" python -m build --wheel --no-isolation
}

package() {
	cd "${_pkgname//-/_}-${pkgver}"

	# Install the Torii ILA wheel and License
	python -m installer --destdir="${pkgdir}" dist/*.whl
	install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
