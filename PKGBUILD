# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-designateclient' 'python2-designateclient')
pkgver='2.6.0'
pkgrel='1'
pkgdesc='Python client library for Designate'
arch=('any')
url='http://docs.openstack.org/developer/python-designateclient'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/python-designateclient#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a python-designateclient{,-py2}
}

build() {
  cd "$srcdir"/python-designateclient
  python setup.py build

  cd "$srcdir"/python-designateclient-py2
  python2 setup.py build
}

package_python-designateclient() {
  depends=('python-cliff' 'python-debtcollector' 'python-jsonschema' 'python-osc-lib'
           'python-oslo-utils' 'python-keystoneauth1' 'python-pbr' 'python-requests'
           'python-six' 'python-stevedore')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-designateclient() {
  depends=('python2-cliff' 'python2-debtcollector' 'python2-jsonschema' 'python2-osc-lib'
           'python2-oslo-utils' 'python2-keystoneauth1' 'python2-pbr' 'python2-requests'
           'python2-six' 'python2-stevedore')
  cd "${srcdir}/python-designateclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/designate{,2}
}

# vim:set ts=2 sw=2 et:
