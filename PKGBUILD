# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python2-atomicwrites
_pkgname=python-atomicwrites
pkgver=1.0.0
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2')
checkdepends=('python2-pytest')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0325c610fefba1951374019ba534590ea47e28065d399b1a845db7159923df87')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export PYTHONPATH="${srcdir}/${_pkgname}-${pkgver}/build":${PYTHONPATH}
  py.test2
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  python2 setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

