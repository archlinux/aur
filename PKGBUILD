# Maintainer: Andy Botting <andy@andybotting.com>

_module='oslo.context'
pkgname=('python-oslo-context' 'python2-oslo-context')
pkgver='2.13.0'
pkgrel='1'
pkgdesc='Oslo context library'
arch=('any')
url="http://docs.openstack.org/developer/${_module}"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools' 'python-pbr' 'python2-pbr')
checkdepends=('python-oslotest' 'python2-oslotest')
source=("git+https://git.openstack.org/openstack/${_module}#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a oslo.context{,-py2}
}

build() {
  cd "$srcdir"/oslo.context
  python setup.py build

  cd "$srcdir"/oslo.context-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/oslo.context
  python setup.py testr

  cd "$srcdir"/oslo.context-py2
  PYTHON=python2 python2 setup.py testr
}

package_python-oslo-context() {
  depends=('python-pbr')

  cd "$srcdir"/oslo.context
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-oslo-context() {
  depends=('python2-pbr')

  cd "$srcdir"/oslo.context-py2
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
