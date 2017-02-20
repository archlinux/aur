# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-troveclient' 'python2-troveclient')
pkgver='2.7.0'
pkgrel='3'
pkgdesc='Python client library for Trove'
arch=('any')
url='http://docs.openstack.org/developer/python-troveclient'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-coverage' 'python2-coverage'
              'python-fixtures' 'python2-fixtures'
              'python-oslotest' 'python2-oslotest'
              'python-requests-mock' 'python2-requests-mock'
              'python-testrepository' 'python2-testrepository'
              'python-testscenarios' 'python2-testscenarios'
              'python-testtools' 'python2-testtools'
              'python-mock' 'python2-mock'
              'python-httplib2' 'python2-httplib2'
              'python-crypto' 'python2-crypto')
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

package_python-troveclient() {
  depends=('python-six' 'python-simplejson' 'python-requests' 'python-swiftclient'
           'python-mistralclient' 'python-pbr' 'python-oslo-utils' 'python-oslo-i18n'
           'python-keystoneauth1' 'python-prettytable' 'python-babel')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-troveclient() {
  depends=('python2-six' 'python2-simplejson' 'python2-requests' 'python2-swiftclient'
           'python2-mistralclient' 'python2-pbr' 'python2-oslo-utils' 'python2-oslo-i18n'
           'python2-keystoneauth1' 'python2-prettytable' 'python2-babel')
  cd "${srcdir}/python-troveclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/trove{,2}
}

# vim:set ts=2 sw=2 et:
