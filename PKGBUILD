# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-mistralclient' 'python2-mistralclient')
pkgver='3.7.0'
pkgrel='2'
pkgdesc='Mistral Client Library'
arch=('any')
url='https://docs.openstack.org/developer/mistral/'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('14797afe8a20942865927536f837320b1b48e171100c58d27ab52e555b53061930c3d238f58e42849cf3227de1830cebe071cc3ee2282b5494ca5cdcbf1e134b')

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

package_python-mistralclient() {
  depends=('python-cliff' 'python-osc-lib' 'python-oslo-utils'
           'python-oslo-i18n' 'python-pbr' 'python-keystoneclient'
           'python-yaml' 'python-requests' 'python-six' 'python-stevedore')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-mistralclient() {
  depends=('python2-cliff' 'python2-osc-lib' 'python2-oslo-utils'
           'python2-oslo-i18n' 'python2-pbr' 'python2-keystoneclient'
           'python2-yaml' 'python2-requests' 'python2-six' 'python2-stevedore')
  cd "${srcdir}/python-mistralclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/mistral{,2}
}

# vim:set ts=2 sw=2 et:
