# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-mistralclient' 'python2-mistralclient')
pkgver='3.8.0'
pkgrel='1'
pkgdesc='Mistral Client Library'
arch=('any')
url='https://docs.openstack.org/developer/mistral/'
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('1fabfc93d68651bde207122d74fc5b810670bed31d3e9beb52aa89b978ac23e141e0dfd2bb2f1561c64b3e3cca8a5311897efc35a9543faebffbeb4de2bc900e')

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
