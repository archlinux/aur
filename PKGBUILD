# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='mplhep_data'
pkgname="python-${_pkgname}"
pkgver='0.0.3'
pkgrel=2
pkgdesc="Sub-package to hold data (fonts) for mplhep."
arch=('any')
url='https://github.com/scikit-hep/mplhep_data'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-importlib-metadata')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py bdist_egg
}

check() {
  cd "${srcdir}/${pkgname}"
  PYTHONPATH="${PWD}/build/lib:${PWD}/src" pytest
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install  --skip-build --root="${pkgdir}/" --optimize=1
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
