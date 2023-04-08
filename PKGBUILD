# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='histoprint'
pkgname="python-${_pkgname}"
pkgver='2.4.0'
pkgrel=2
pkgdesc="Pretty print Numpy (and other) histograms to the console."
arch=('any')
url='https://github.com/scikit-hep/histoprint'
license=('MIT')
depends=('python-numpy' 'python-click' 'python-uhi')
makedepends=('git' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib" pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
