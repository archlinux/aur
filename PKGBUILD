# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-muranoclient' 'python2-muranoclient')
pkgver='0.12.0'
pkgrel='1'
pkgdesc='Python client library for Murano'
arch=('any')
url='http://docs.openstack.org/developer/python-muranoclient'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/python-muranoclient#tag=$pkgver")
sha256sums=('SKIP')

prepare() {
  cp -a python-muranoclient{,-py2}
}

build() {
  cd "$srcdir"/python-muranoclient
  python setup.py build

  cd "$srcdir"/python-muranoclient-py2
  python2 setup.py build
}

package_python-muranoclient() {
  depends=('python-pbr' 'python-prettytable' 'python-glanceclient' 'python-keystoneclient'
           'python-iso8601' 'python-babel' 'python-pyopenssl' 'python-requests'
           'python-yaml' 'python-yaql' 'python-osc-lib' 'python-oslo-serialization'
           'python-oslo-utils' 'python-oslo-i18n')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-muranoclient() {
  depends=('python-pbr' 'python-prettytable' 'python-glanceclient' 'python-keystoneclient'
           'python-iso8601' 'python-babel' 'python-pyopenssl' 'python-requests'
           'python2-yaml' 'python-yaql' 'python-osc-lib' 'python-oslo-serialization'
           'python-oslo-utils' 'python-oslo-i18n')
  cd "${srcdir}/python-muranoclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/murano{,2}
}

# vim:set ts=2 sw=2 et:
