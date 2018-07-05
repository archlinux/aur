# Maintainer: Andy Botting <andy@andybotting.com>

_module='futurist'
pkgname=('python-futurist' 'python2-futurist')
pkgver='1.7.0'
pkgrel='1'
pkgdesc='Oslo Log library'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools'
             'python-pbr' 'python2-pbr'
             'python-six' 'python2-six'
             'python-monotonic' 'python2-monotonic'
             'python2-futures'
             'python2-contextlib2'
             'python-prettytable' 'python2-prettytable')
checkdepends=('python-eventlet' 'python2-eventlet'
              'python-oslotest' 'python2-oslotest'
              'python-testrepository' 'python2-testrepository'
              'python-testscenarios' 'python2-testscenarios'
              'python-testtools' 'python2-testtools')
source=("git+https://git.openstack.org/openstack/${_module}#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  cp -a "${srcdir}/${_module}"{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${_module}"
  python setup.py test

  cd "${srcdir}/${_module}-py2"
  PYTHON=python2 python2 setup.py test
}

package_python-futurist() {
  depends=('python-pbr' 'python-six' 'python-monotonic'
           'python-prettytable')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-futurist() {
  depends=('python2-pbr' 'python2-six' 'python2-monotonic' 'python2-futures'
           'python2-contextlib2' 'python2-prettytable')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
