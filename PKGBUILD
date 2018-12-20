# Maintainer: Andy Botting <andy@andybotting.com>

_module='futurist'
pkgname=('python-futurist' 'python2-futurist')
pkgver='1.8.0'
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
source=("https://github.com/openstack/${_module}/archive/${pkgver}.tar.gz")
sha512sums=('ab438d8ddaee50eb67674195def2d2d2e3646ad073ee21d867870b0f239f750eced8a51bc05dce9aa834ca483835f5aaeff52d148d11389c7d4bcbb13c3b8c1a')

prepare() {
  cp -a "${srcdir}/${_module}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py build
}

# Tests disabled due to eventlet issues
check() {
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py test

  cd "${srcdir}/${_module}-${pkgver}-py2"
  PYTHON=python2 python2 setup.py test
}

package_python-futurist() {
  depends=('python-pbr' 'python-six' 'python-monotonic'
           'python-prettytable')
  cd "${srcdir}/${_module}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-futurist() {
  depends=('python2-pbr' 'python2-six' 'python2-monotonic' 'python2-futures'
           'python2-contextlib2' 'python2-prettytable')
  cd "${srcdir}/${_module}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
