# Maintainer: Andy Botting <andy@andybotting.com>
_module='oslo.context'
pkgname=('python-oslo-context' 'python2-oslo-context')
pkgver='2.13.0'
pkgrel='2'
pkgdesc='Oslo context library'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-oslotest' 'python2-oslotest')
source=("git+https://git.openstack.org/openstack/${_module}#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a ${_module}{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  python setup.py testr

  cd "${srcdir}/${_module}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-oslo-context() {
  depends=('python-pbr')
  cd "${srcdir}/${_module}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-oslo-context() {
  depends=('python2-pbr')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
