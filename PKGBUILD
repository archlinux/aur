# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-mistralclient' 'python2-mistralclient')
pkgver='3.3.0'
pkgrel='1'
pkgdesc='Mistral Client Library'
arch=('any')
url='https://docs.openstack.org/developer/mistral/'
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

package_python-mistralclient() {
  depends=('python-cliff' 'python-osc-lib' 'python-oslo-utils'
           'python-oslo-i18n' 'python-pbr' 'python-keystoneclient'
           'python-yaml' 'python-requests' 'python-six' 'python-stevedore')
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-mistralclient() {
  depends=('python2-cliff' 'python2-osc-lib' 'python2-oslo-utils'
           'python2-oslo-i18n' 'python2-pbr' 'python2-keystoneclient'
           'python2-yaml' 'python2-requests' 'python2-six' 'python2-stevedore')
  cd "${srcdir}/python-mistralclient-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/mistral{,2}
}

# vim:set ts=2 sw=2 et:
