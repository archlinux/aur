# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-mistralclient' 'python2-mistralclient')
pkgver='2.1.2'
pkgrel='1'
pkgdesc='Python client library for Mistral'
arch=('any')
url='http://docs.openstack.org/developer/python-mistralclient'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/python-mistralclient#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  cp -a python-mistralclient{,-py2}
}

build() {
  cd "$srcdir"/python-mistralclient
  python setup.py build

  cd "$srcdir"/python-mistralclient-py2
  python2 setup.py build
}

package_python-mistralclient() {
  depends=('python-six' 'python-requests' 'python-pbr' 'python-keystoneclient'
           'python-oslo-utils' 'python-osc-lib' 'python-cliff' 'python-yaml')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-mistralclient() {
  depends=('python2-six' 'python2-requests' 'python2-pbr' 'python2-keystoneclient'
           'python2-oslo-utils' 'python2-osc-lib' 'python2-cliff' 'python2-yaml')
  cd "${srcdir}/python-mistralclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/mistral{,2}
}

# vim:set ts=2 sw=2 et:
