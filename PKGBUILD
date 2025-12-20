# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='histoprint'
pkgname="python-${_pkgname}"
pkgver=2.6.0
pkgrel=2
pkgdesc="Pretty print Numpy (and other) histograms to the console."
arch=('any')
url='https://github.com/scikit-hep/histoprint'
license=('MIT')
depends=('python-numpy' 'python-click' 'python-uhi')
makedepends=('git' 'python-build' 'python-installer' 'python-hatchling' 'python-hatch-vcs')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('afb8969adfbaa332117b606c86ca89618fd632f47df37c912da9fba9c20c04c0')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHONPATH="${PWD}" pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
