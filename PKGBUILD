# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=python-rawkit
pkgver=0.5.0
pkgrel=1
pkgdesc='CTypes based LibRaw bindings'
arch=('any')
url='https://pypi.python.org/pypi/rawkit'
license=('MIT')
depends=('libraw' 'python')
makedepends=('python-setuptools' 'python-sphinx')
source=("rawkit-${pkgver}.tar.gz::https://github.com/photoshell/rawkit/archive/v${pkgver}.tar.gz")
sha256sums=('9270941d3293f2814dafaf548e20e6727443ec668207a99afafc875027b3bab8')

build() {
  cd rawkit-${pkgver}
  python setup.py build
  python setup.py build_sphinx -b man
}

package(){
  cd rawkit-${pkgver}
  python setup.py install --root="${pkgdir}" --optimize='1'
  install -Dm644 build/sphinx/man/rawkit.1 "$pkgdir/usr/share/man/man1/rawkit.1"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
