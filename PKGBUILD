# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-saharaclient' 'python2-saharaclient')
pkgver='2.0.0'
pkgrel='2'
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
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('176c77d215bb27508bc4b6ee7bf2b8e11e3ddb6f8c7caee085bae3944ea0a3e0c170d238b74551c1549e4e0ee1d1bc17e4d618476be32641c2ad34526d8df8c8')

prepare() {
  sed -i 's/pep8/pycodestyle/g' "${srcdir}/${pkgname}-${pkgver}/saharaclient/tests/hacking/checks.py"
  cp -a "${srcdir}/${pkgname}-${pkgver}"{,-py2}
  export PBR_VERSION=$pkgver
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  python2 setup.py build
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ostestr

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  ostestr2
}

package_python-saharaclient() {
  depends=('python-pbr' 'python-keystoneauth1' 'python-osc-lib' 'python-oslo-log'
           'python-oslo-serialization' 'python-oslo-i18n' 'python-oslo-utils'
           'python-openstackclient' 'python-requests' 'python-six')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-saharaclient() {
  depends=('python2-pbr' 'python2-keystoneauth1' 'python2-osc-lib' 'python2-oslo-log'
           'python2-oslo-serialization' 'python2-oslo-i18n' 'python2-oslo-utils'
           'python2-openstackclient' 'python2-requests' 'python2-six')
  cd "${srcdir}/python-saharaclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
