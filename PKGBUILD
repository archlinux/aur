# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='mplhep_data'
pkgname="python-${_pkgname}"
pkgver=0.0.4
pkgrel=1
pkgdesc="Sub-package to hold data (fonts) for mplhep."
arch=('any')
url='https://github.com/scikit-hep/mplhep_data'
license=('MIT')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest' 'python-importlib-metadata')
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('dc954083cb87e4e47b7525f9b964767770b3497e2a2c8a640efc30f3b1cc7a56')

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
