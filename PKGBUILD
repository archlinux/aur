# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-saharaclient' 'python2-saharaclient')
pkgver='2.0.0'
pkgrel='1'
pkgdesc='Python client library for Sahara'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-keystoneauth1' 'python2-keystoneauth1'
              'python-osc-lib' 'python2-osc-lib'
              'python-oslo-log' 'python2-oslo-log'
              'python-oslo-serialization' 'python2-oslo-serialization'
              'python-oslo-i18n' 'python2-oslo-i18n'
              'python-oslo-utils' 'python2-oslo-utils'
              'python-openstackclient' 'python2-openstackclient'
              'python-requests' 'python2-requests'
              'python-six' 'python2-six'
              'python-mock' 'python2-mock'
              'python-hacking' 'python2-hacking'
              'python-pycodestyle' 'python2-pycodestyle'
              'python-oslotest' 'python2-oslotest'
              'python-os-testr' 'python2-os-testr'
              'python-requests-mock' 'python2-requests-mock'
              'python-testrepository' 'python2-testrepository')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
sha512sums=('SKIP')

prepare() {
  sed -i 's/pep8/pycodestyle/g' "${srcdir}/${pkgname}/saharaclient/tests/hacking/checks.py"
  cp -a "${srcdir}/${pkgname}"{,-py2}
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build

  cd "${srcdir}/${pkgname}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}"
  ostestr

  cd "${srcdir}/${pkgname}-py2"
  ostestr2
}

package_python-saharaclient() {
  depends=('python-pbr' 'python-keystoneauth1' 'python-osc-lib' 'python-oslo-log'
           'python-oslo-serialization' 'python-oslo-i18n' 'python-oslo-utils'
           'python-openstackclient' 'python-requests' 'python-six')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-saharaclient() {
  depends=('python2-pbr' 'python2-keystoneauth1' 'python2-osc-lib' 'python2-oslo-log'
           'python2-oslo-serialization' 'python2-oslo-i18n' 'python2-oslo-utils'
           'python2-openstackclient' 'python2-requests' 'python2-six')
  cd "${srcdir}/python-saharaclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
