# Contributor: Andrea Scarpino <andrea@archlinux.org|

pkgbase=python-spec
pkgname=('python-spec' 'python2-spec')
pkgver=1.4.1
pkgrel=1
pkgdesc='Specification-style nosetests output for Python'
arch=('any')
url='https://github.com/bitprophet/spec'
license=('MIT')
makedepends=('python' 'python2' 'python-setuptools' 'python2-setuptools')
source=(spec-${pkgver}.tar.gz::"https://github.com/bitprophet/spec/archive/${pkgver}.tar.gz")
md5sums=('edc89427ff58f2c22f3f3873318e3bc7')

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
