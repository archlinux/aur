# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-ironicclient' 'python2-ironicclient')
pkgver='2.3.0'
pkgrel='1'
pkgdesc='Python client library for Ironic'
arch=('any')
url="https://docs.openstack.org/developer/${pkgname}/"
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

package_python-ironicclient() {
  depends=('python-six' 'python-requests' 'python-yaml'
           'python-openstackclient' 'python-prettytable' 'python-oslo-utils'
           'python-oslo-serialization' 'python-oslo-i18n' 'python-osc-lib'
           'python-keystoneauth1' 'python-jsonschema' 'python-dogpile.cache'
           'python-appdirs' 'python-pbr')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-ironicclient() {
  depends=('python2-six' 'python2-requests' 'python2-yaml'
           'python2-openstackclient' 'python2-prettytable' 'python2-oslo-utils'
           'python2-oslo-serialization' 'python2-oslo-i18n' 'python2-osc-lib'
           'python2-keystoneauth1' 'python2-jsonschema' 'python2-dogpile.cache'
           'python2-appdirs' 'python2-pbr')
  cd "${srcdir}/python-ironicclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/ironic{,2}
}

# vim:set ts=2 sw=2 et:
