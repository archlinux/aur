# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='hist'
pkgname="python-${_pkgname}"
pkgver='2.6.1'
pkgrel=1
pkgdesc="Python bindings for Boost's Histogram library."
arch=('any')
url='https://github.com/scikit-hep/hist'
license=('custom:BSD3')
depends=('python-boost-histogram' 'python-histoprint' 'python-typing_extensions')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-pytest-benchmark' 'python-pytest-mpl' 'python-iminuit' 'python-mplhep' 'python-scipy' 'python-jinja')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  PYTHONPATH="${PWD}/build/lib" pytest
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PYTHONHASHSEED=0
  python setup.py install  --skip-build --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
