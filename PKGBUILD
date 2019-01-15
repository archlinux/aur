# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-magnumclient' 'python2-magnumclient')
pkgver='2.11.0'
pkgrel='2'
pkgdesc='Python client library for Magnum'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('0a7e651442dd1edd1bffa8f3c7d897163543242331cecac922fb3102262f2af48c3eb708c3a368232b8169dfbaa65b76281e644b77341f14e22cb6c38dea9f30')

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

package_python-magnumclient() {
  depends=('python-decorator' 'python-cryptography' 'python-prettytable'
           'python-os-client-config' 'python-oslo-utils'
           'python-oslo-serialization' 'python-oslo-i18n' 'python-requests'
           'python-stevedore' 'python-keystoneauth1' 'python-six'
           'python-babel' 'python-pbr')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-magnumclient() {
  depends=('python2-decorator' 'python2-cryptography' 'python2-prettytable'
           'python2-os-client-config' 'python2-oslo-utils'
           'python2-oslo-serialization' 'python2-oslo-i18n' 'python2-requests'
           'python2-stevedore' 'python2-keystoneauth1' 'python2-six'
           'python2-babel' 'python2-pbr')
  cd "${srcdir}/python-magnumclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/magnum{,2}
}

# vim:set ts=2 sw=2 et:
