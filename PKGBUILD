# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-manilaclient' 'python2-manilaclient')
pkgver='1.14.0'
pkgrel='2'
pkgdesc='Client library for OpenStack Manila API'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
checkdepends=('python-pbr'
              'python-oslo-config'
              'python-oslo-log'
              'python-oslo-serialization'
              'python-oslo-utils'
              'python-prettytable'
              'python-requests'
              'python-simplejson'
              'python-babel'
              'python-six'
              'python-keystoneclient'
              'python-ddt'
              'python-fixtures'
              'python-mock'
              'python-oslotest' 
              'python-testtools' 
              'python-tempest')
md5sums=('SKIP')

prepare() {
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
  python setup.py testr

  #cd "${srcdir}/${pkgname}-py2"
  #PYTHON=python2 python2 setup.py testr
}

package_python-manilaclient() {
  depends=('python-oslo-config' 'python-oslo-log' 'python-oslo-serialization'
           'python-oslo-utils' 'python-pbr' 'python-prettytable'
           'python-requests' 'python-simplejson' 'python-babel' 'python-six'
           'python-keystoneclient')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-manilaclient() {
  depends=('python2-oslo-config' 'python2-oslo-log'
           'python2-oslo-serialization' 'python2-oslo-utils' 'python2-pbr'
           'python2-prettytable' 'python2-requests' 'python2-simplejson'
           'python2-babel' 'python2-six' 'python2-keystoneclient')
  cd "${srcdir}/python-manilaclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/manila{,2}
}

# vim:set ts=2 sw=2 et:
