# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-magnumclient' 'python2-magnumclient')
pkgver='2.9.0'
pkgrel='1'
pkgdesc='Python client library for Magnum'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
source=("git+https://git.openstack.org/openstack/${pkgname}#tag=${pkgver}")
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

package_python-magnumclient() {
  depends=('python-decorator' 'python-cryptography' 'python-prettytable'
           'python-os-client-config' 'python-oslo-utils'
           'python-oslo-serialization' 'python-oslo-i18n' 'python-requests'
           'python-stevedore' 'python-keystoneauth1' 'python-six'
           'python-babel' 'python-pbr')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-magnumclient() {
  depends=('python2-decorator' 'python2-cryptography' 'python2-prettytable'
           'python2-os-client-config' 'python2-oslo-utils'
           'python2-oslo-serialization' 'python2-oslo-i18n' 'python2-requests'
           'python2-stevedore' 'python2-keystoneauth1' 'python2-six'
           'python2-babel' 'python2-pbr')
  cd "${srcdir}/python-magnumclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/magnum{,2}
}

# vim:set ts=2 sw=2 et:
