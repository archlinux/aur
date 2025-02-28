# Maintainer: Sigurd Hellesvik <sigurd@hellesvik.eu>

_pkgname=nrf_regtool
pkgname=python-${_pkgname}
pkgver=8.1.3
pkgrel=1
pkgdesc='Generate memory-mapped binary files of peripheral register content, based on System View Description (SVD) files and configuration files.'
arch=('x86_64')
url="https://pypi.org/project/${_pkgname}/"
license=(Apache-2.0)
depends=('python' 'python-click' 'python-intelhex' 'python-tomli' 'python-svada' 'python-devicetree')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/n/nrf-regtool/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ff9ed92e91c97328c39d3224e12a97e77e78775222c8e44dd0c69d9f074bfe7f')

build() {
	cd "${_pkgname}-${pkgver}"
  python -m build --wheel
}

package() {
	cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
