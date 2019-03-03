# Maintainer: redfish <redfish@galactica.pw>

pkgbase=python-httmock
pkgname=('python-httmock' 'python2-httmock')
_name=httmock
pkgver=1.3.0
pkgrel=1
pkgdesc='py.test plugin to run your tests in a specific order'
arch=('any')
license=('MIT')
url='https://github.com/partys/httmock'
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('f713ddf45675738582a3611e01a55babce2951231b34fb9ca6b1b64fcf60a3862994ff7ad4cd7a224a116c6acb1caa267978a7cb6fedd02676fa2a01f90e93aa')

prepare() {
  cp -a httmock-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/httmock-$pkgver
  python setup.py build

  cd "$srcdir"/httmock-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/httmock-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.7/site-packages:$PYTHONPATH:$PWD/tests" py.test || warning "Tests failed"

  cd "$srcdir"/httmock-$pkgver-py2
  python2 setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python2.7/site-packages:$PYTHONPATH:$PWD/tests" py.test2 || warning "Tests failed"
}

package_python-httmock() {
  cd httmock-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
}

package_python2-httmock() {
  cd httmock-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
}
# vim:set ts=2 sw=2 et:
