# Contributor: Andrea Scarpino <andrea@archlinux.org|

pkgbase=python-spec
pkgname=('python-spec' 'python2-spec')
pkgver=1.3.1
pkgrel=1
pkgdesc='Specification-style nosetests output for Python'
arch=('any')
url='https://github.com/bitprophet/spec'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=(spec-${pkgver}.tar.gz::"https://github.com/bitprophet/spec/archive/${pkgver}.tar.gz")
md5sums=('6414e90f0c911a187b3439cd2e84f16e')

prepare() {
  cp -a spec{,-py2}-${pkgver}
}

build() {
  cd spec-${pkgver}
  python setup.py build

  cd ../spec-py2-${pkgver}
  python2 setup.py build
}

package_python-spec() {
  depends=('python' 'python-nose' 'python-six')

  cd spec-${pkgver}
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-spec() {
  depends=('python2' 'python2-nose' 'python2-six')

  cd spec-py2-${pkgver}
  python2 setup.py install --root="$pkgdir/" --optimize=1

  mv "${pkgdir}"/usr/bin/spec "${pkgdir}"/usr/bin/python2-spec
}
