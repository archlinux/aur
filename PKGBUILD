# Maintainer: Andy Botting <andy@andybotting.com>
_module=tempest
pkgname=('python-tempest' 'python2-tempest')
pkgver='15.0.0'
pkgrel='1'
pkgdesc='The OpenStack Integration Test Suite'
arch=('any')
url="http://docs.openstack.org/developer/tempest"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'python-paramiko' 'python2-paramiko')
source=("git+https://git.openstack.org/openstack/tempest#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  cp -a ${_module}{,-py2}
}

build() {
  cd "${srcdir}/${_module}"
  python setup.py build

  cd "${srcdir}/${_module}-py2"
  python2 setup.py build
}

package_python-tempest() {
  depends=('python-pbr' 'python-cliff' 'python-jsonschema' 'python-testtools'
           'python-paramiko' 'python-netaddr' 'python-testrepository'
           'python-oslo-concurrency' 'python-oslo-config' 'python-oslo-log'
           'python-oslo-serialization' 'python-oslo-utils' 'python-six'
           'python-fixtures' 'python-yaml' 'python-subunit' 'python-stevedore'
           'python-prettytable' 'python-os-testr' 'python-urllib3' 
           'python-debtcollector')
  cd "${srcdir}/${_module}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-tempest() {
  depends=('python2-pbr' 'python2-cliff' 'python2-jsonschema' 'python2-testtools'
           'python2-paramiko' 'python2-netaddr' 'python2-testrepository'
           'python2-oslo-concurrency' 'python2-oslo-config' 'python2-oslo-log'
           'python2-oslo-serialization' 'python2-oslo-utils' 'python2-six'
           'python2-fixtures' 'python2-yaml' 'python2-subunit' 'python2-stevedore'
           'python2-prettytable' 'python2-os-testr' 'python2-urllib3' 
           'python2-debtcollector' 'python2-unittest2')

  cd "${srcdir}/${_module}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1

  msg "Removing binaries and sample config files from py2 package..."
  rm -fr "${pkgdir}"/usr/bin/* "${pkgdir}"/usr/etc/${_module}
}

# vim:set ts=2 sw=2 et:
