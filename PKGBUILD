# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-heatclient'
         'python2-heatclient')
pkgver='1.17.0'
pkgrel='1'
pkgdesc='Python client library for Heat'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('python-setuptools'
             'python2-setuptools')
checkdepends=('python-babel' 'python2-babel' 
              'python-pbr' 'python2-pbr'
              'python-cliff' 'python2-cliff'
              'python-iso8601' 'python-iso8601'
              'python-osc-lib' 'python2-osc-lib'
              'python-prettytable' 'python2-prettytable'
              'python-oslo-i18n' 'python2-oslo-i18n'
              'python-oslo-serialization' 'python2-oslo-serialization'
              'python-oslo-utils' 'python2-oslo-utils'
              'python-keystoneauth1' 'python2-keystoneauth1'
              'python-swiftclient' 'python2-swiftclient'
              'python-yaml' 'python2-yaml'
              'python-requests' 'python2-requests'
              'python-six' 'python2-six'
              'python-openstackclient' 'python2-openstackclient'
              'python-requests' 'python2-requests'
              'python-six' 'python2-six'
              'python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'python-os-testr'
              'python-requests-mock' 'python2-requests-mock'
              'python-testrepository' 'python2-testrepository')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('fb16f17e1313d1897291fdb4f72641a5e288283a96d88813421f12546e540ffe3a184cd0ec39f9f5acf9aa2f036dc3449ead0269b916c571ee1ec00c152202f9')

prepare() {
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
  stestr run

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  PYTHON=python2 stestr2 run
}

package_python-heatclient() {
  depends=('python-babel'
           'python-pbr' 
           'python-cliff'
           'python-iso8601'
           'python-osc-lib'
           'python-prettytable'
           'python-oslo-i18n'
           'python-oslo-serialization' 
           'python-oslo-utils'
           'python-keystoneauth1'
           'python-swiftclient'
           'python-yaml'
           'python-requests'
           'python-six')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-heatclient() {
  depends=('python2-babel'
           'python2-pbr' 
           'python2-cliff'
           'python2-iso8601'
           'python2-osc-lib'
           'python2-prettytable'
           'python2-oslo-i18n'
           'python2-oslo-serialization' 
           'python2-oslo-utils'
           'python2-keystoneauth1'
           'python2-swiftclient'
           'python2-yaml'
           'python2-requests'
           'python2-six')
  cd "${srcdir}/python-heatclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/heat{,2}
}

# vim:set ts=2 sw=2 et:
