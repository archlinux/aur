# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-octaviaclient' 'python2-octaviaclient')
pkgver='1.8.0'
pkgrel='1'
pkgdesc='OpenStack Client plugin for Octavia, an OpenStack Load Balancing project'
arch=('any')
url="https://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('git'
             'python-appdirs' 'python2-appdirs'
             'python-babel' 'python2-babel'
             'python-cliff' 'python2-cliff'
             'python-cmd2' 'python2-cmd2'
             'python-debtcollector' 'python2-debtcollector'
             'python2-funcsigs'
             'python-iso8601' 'python2-iso8601'
             'python-keystoneauth1' 'python2-keystoneauth1'
             'python-monotonic' 'python2-monotonic'
             'python-netaddr' 'python2-netaddr'
             'python-netifaces' 'python2-netifaces'
             'python-neutronclient' 'python2-neutronclient'
             'python-openstackclient' 'python2-openstackclient'
             'python-os-client-config' 'python2-os-client-config'
             'python-osc-lib' 'python2-osc-lib'
             'python-oslo-i18n' 'python2-oslo-i18n'
             'python-oslo-utils' 'python2-oslo-utils'
             'python-pbr' 'python2-pbr'
             'python-prettytable' 'python2-prettytable'
             'python-pyparsing' 'python2-pyparsing'
             'python-pytz' 'python2-pytz'
             'python-yaml' 'python2-yaml'
             'python-requests' 'python2-requests'
             'python-requestsexceptions' 'python2-requestsexceptions'
             'python-simplejson' 'python2-simplejson'
             'python-six' 'python2-six'
             'python-stevedore' 'python2-stevedore'
             'python2-unicodecsv'
             'python-wrapt' 'python2-wrapt')
checkdepends=('python-requests-mock' 'python2-requests-mock'
              'python-mock' 'python2-mock'
              'python-oslotest' 'python2-oslotest'
              'python-stestr' 'python2-stestr')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('6ee8d6e252f2ff83a00ce243261e227b194fc873320ce81e91be769580918c01f05566fc2a8d290f4a9070514ba1138721566b48a2cb484b87f60de520efce26')

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

package_python-octaviaclient() {
  depends=('python-appdirs' 'python-babel' 'python-cliff' 'python-cmd2'
           'python-debtcollector' 'python-iso8601'
           'python-keystoneauth1' 'python-monotonic' 'python-netaddr'
           'python-netifaces' 'python-neutronclient' 'python-openstackclient'
           'python-os-client-config' 'python-osc-lib' 'python-oslo-i18n'
           'python-oslo-utils' 'python-pbr' 'python-prettytable'
           'python-pyparsing' 'python-pytz' 'python-yaml' 'python-requests'
           'python-requestsexceptions' 'python-simplejson' 'python-six'
           'python-stevedore' 'python-wrapt')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-octaviaclient() {
  depends=('python2-appdirs' 'python2-babel' 'python2-cliff' 'python2-cmd2'
           'python2-debtcollector' 'python2-funcsigs' 'python2-iso8601'
           'python2-keystoneauth1' 'python2-monotonic' 'python2-netaddr'
           'python2-netifaces' 'python2-neutronclient'
           'python2-openstackclient' 'python2-os-client-config'
           'python2-osc-lib' 'python2-oslo-i18n' 'python2-oslo-utils'
           'python2-pbr' 'python2-prettytable' 'python2-pyparsing'
           'python2-pytz' 'python2-yaml' 'python2-requests'
           'python2-requestsexceptions' 'python2-simplejson' 'python2-six'
           'python2-stevedore' 'python2-unicodecsv' 'python2-wrapt')
  cd "${srcdir}/python-octaviaclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
