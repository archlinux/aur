# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-manilaclient' 'python2-manilaclient')
pkgver='1.13.0'
pkgrel='1'
pkgdesc='Python client library for Manila'
arch=('any')
url='http://docs.openstack.org/developer/python-manilaclient'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/python-manilaclient#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a python-manilaclient{,-py2}
}

build() {
  cd "$srcdir"/python-manilaclient
  python setup.py build

  cd "$srcdir"/python-manilaclient-py2
  python2 setup.py build
}

package_python-manilaclient() {
  depends=('python-oslo-config' 'python-oslo-log' 'python-oslo-serialization'
           'python-oslo-utils' 'python-pbr' 'python-prettytable' 'python-requests'
           'python-simplejson' 'python-babel' 'python-six' 'python-keystoneclient')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-manilaclient() {
  depends=('python2-oslo-config' 'python2-oslo-log' 'python2-oslo-serialization'
           'python2-oslo-utils' 'python2-pbr' 'python2-prettytable' 'python2-requests'
           'python2-simplejson' 'python2-babel' 'python2-six' 'python2-keystoneclient')
  cd "${srcdir}/python-manilaclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/manila{,2}
}

# vim:set ts=2 sw=2 et:
