# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python-atomicwrites
pkgver=1.0.0
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('0325c610fefba1951374019ba534590ea47e28065d399b1a845db7159923df87')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export PYTHONPATH="${srcdir}/${pkgname}-${pkgver}/build":${PYTHONPATH}
  py.test
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}/" --optimize=1

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

