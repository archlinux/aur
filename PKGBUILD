# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-designateclient' 'python2-designateclient')
pkgver='2.10.0'
pkgrel='1'
pkgdesc='Python client library for Designate'
arch=('any')
url="https://docs.openstack.org/developer/${pkgname}"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-cliff' 'python2-cliff'
              'python-debtcollector' 'python2-debtcollector'
              'python-jsonschema' 'python2-jsonschema'
              'python-osc-lib' 'python2-osc-lib'
              'python-oslo-utils' 'python2-oslo-utils'
              'python-keystoneauth1' 'python2-keystoneauth1'
              'python-pbr' 'python2-pbr'
              'python-requests' 'python2-requests'
              'python-six' 'python2-six'
              'python-stevedore' 'python2-stevedore'
              'python-oslo-config' 'python2-oslo-config'
              'python-oslotest' 'python2-oslotest'
              'python-requests-mock' 'python2-requests-mock'
              'python-subunit' 'python2-subunit')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=$pkgver")
sha512sums=('SKIP')

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
  stestr run

  cd "${srcdir}/${pkgname}-py2"
  PYTHON=python2 stestr run
}

package_python-designateclient() {
  depends=('python-cliff' 'python-debtcollector' 'python-jsonschema'
           'python-osc-lib' 'python-oslo-utils' 'python-keystoneauth1'
           'python-pbr' 'python-requests' 'python-six' 'python-stevedore')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-designateclient() {
  depends=('python2-cliff' 'python2-debtcollector' 'python2-jsonschema'
           'python2-osc-lib' 'python2-oslo-utils' 'python2-keystoneauth1'
           'python2-pbr' 'python2-requests' 'python2-six' 'python2-stevedore')
  cd "${srcdir}/python-designateclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/designate{,2}
}

# vim:set ts=2 sw=2 et:
