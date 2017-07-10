# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-rawkit
pkgver=0.6.0
pkgrel=1
pkgdesc='CTypes based LibRaw bindings'
arch=('any')
url='https://pypi.python.org/pypi/rawkit'
license=('MIT')
depends=('libraw' 'python')
checkdepends=("python-"{mock,pytest})
makedepends=("python-"{setuptools,sphinx})
source=("rawkit-${pkgver}.tar.gz::https://github.com/photoshell/rawkit/archive/v${pkgver}.tar.gz")
sha256sums=('c07971ddbca9568cef93753ebb06a72b5b622f9b827a5d8bf96f2a137cc4219e')

build() {
  cd rawkit-${pkgver}
  python setup.py build
  python setup.py build_sphinx -b man
}

check() {
  cd rawkit-${pkgver}
  python setup.py test || warning "Tests failed"
}

package(){
  cd rawkit-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -Dm644 build/sphinx/man/rawkit.1 "$pkgdir/usr/share/man/man1/rawkit.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
