# Maintainer: Konstantin Gizdov <arch at kge dot pw>

_pkgname='vector'
pkgname="python-${_pkgname}"
pkgver='0.8.4'
pkgrel=1
pkgdesc="A library for 2D, 3D, and Lorentz vectors, especially arrays of vectors, to solve common physics problems in a NumPy-like way."
arch=('any')
url='https://github.com/scikit-hep/vector'
license=('MIT')
depends=('python-numpy' 'python-packaging' 'python-importlib-metadata' 'python-typing-extensions')
makedepends=('git' 'python-setuptools' 'python-setuptools-scm' 'python-toml')
checkdepends=('python-pytest' )
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
