# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python-atomicwrites
pkgver=0.1.9
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python-setuptools')
depends=('python')
checkdepends=('python-pytest')
source=(${pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a4737f08efdbbed963e15a1fc28dba23b397654628553153a7e19de6d61dae02')

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

