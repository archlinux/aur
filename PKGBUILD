# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-saharaclient' 'python2-saharaclient')
pkgver='1.1.0'
pkgrel='1'
pkgdesc='Python client library for Trove'
arch=('any')
url='http://docs.openstack.org/developer/python-saharaclient'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-hacking' 'python2-hacking'
              'python-coverage' 'python2-coverage'
              'python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'python-os-testr' 'python2-os-testr'
              'python-requests-mock' 'python2-requests-mock'
              'python-testrepository' 'python2-testrepository')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
md5sums=('SKIP')

prepare() {
  cp -a "${srcdir}/${pkgname}"{,-py2}
}

build() {
  cd "${srcdir}/${pkgname}"
  python setup.py build

  cd "${srcdir}/${pkgname}"-py2
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}"
  python setup.py testr

  cd "${srcdir}/${pkgname}-py2"
  PYTHON=python2 python2 setup.py testr
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
