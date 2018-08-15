# Maintainer: Andy Botting <andy@andybotting.com>

_module='oslo.log'
pkgname=('python-oslo-log' 'python2-oslo-log')
pkgver='3.39.0'
pkgrel='2'
pkgdesc='Oslo Log library'
arch=('any')
url="https://docs.openstack.org/developer/${_module}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools'
             'python-pbr' 'python2-pbr'
             'python-six' 'python2-six'
             'python-oslo-config' 'python2-oslo-config'
             'python-oslo-context' 'python2-oslo-context'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-oslo-serialization' 'python2-oslo-serialization'
             'python-debtcollector' 'python2-debtcollector'
             'python-pyinotify' 'python2-pyinotify'
             'python-dateutil' 'python2-dateutil'
             'python-monotonic' 'python2-monotonic')
checkdepends=('python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'bandit'
              'python-reno'
              'python2-unittest2')
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

#  # These are for python 2.x and old python 3.x only
#  sed -i 's/unittest2/unittest/g' oslo_log/tests/unit/test_versionutils.py
#  python setup.py test
#
#  cd "${srcdir}/${_module}-py2"
#  PYTHON=python2 python2 setup.py test
#}

package_python-oslo-log() {
  depends=('python-six' 'python-pbr' 'python-oslo-config'
           'python-oslo-context' 'python-oslo-i18n' 'python-oslo-utils'
           'python-oslo-serialization' 'python-debtcollector'
           'python-pyinotify' 'python-dateutil' 'python-monotonic')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

package_python2-oslo-log() {
  depends=('python2-six' 'python2-pbr' 'python2-oslo-config'
           'python2-oslo-context' 'python2-oslo-i18n' 'python2-oslo-utils'
           'python2-oslo-serialization' 'python2-debtcollector'
           'python2-pyinotify' 'python2-dateutil' 'python2-monotonic')
  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  mv "${pkgdir}"/usr/bin/convert-json{,2}
}

# vim:set ts=2 sw=2 et:
