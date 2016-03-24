# Maintainer: eolianoe <eolianoe At GoogleMAIL DoT com>

pkgname=python2-atomicwrites
_pkgname=python-atomicwrites
pkgver=0.1.9
pkgrel=1
pkgdesc="Atomic file writes on POSIX"
arch=('any')
url="https://github.com/untitaker/python-atomicwrites"
license=('MIT')
makedepends=('python2-setuptools')
depends=('python2')
checkdepends=('python2-pytest')
source=(${_pkgname}-${pkgver}.tar.gz::"https://github.com/untitaker/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('a4737f08efdbbed963e15a1fc28dba23b397654628553153a7e19de6d61dae02')

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

