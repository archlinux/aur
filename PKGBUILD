# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-gnocchiclient' 'python2-gnocchiclient')
pkgver='7.0.4'
pkgrel='1'
pkgdesc='Python bindings to the Gnocchi API'
arch=('any')
url='https://gnocchi.xyz/gnocchiclient/'
license=('Apache')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-cliff' 'python2-cliff'
              'python-ujson' 'python2-ujson'
              'python-keystoneauth1' 'python2-keystoneauth1'
              'python-six' 'python2-six'
              'python-futurist' 'python2-futurist'
              'python-iso8601' 'python2-iso8601'
              'python-monotonic' 'python2-monotonic'
              'python-dateutil' 'python2-dateutil'
              'python-debtcollector' 'python2-debtcollector'
              'python-testtools' 'python2-testtools'
              'python-fixtures' 'python2-fixtures'
              'python-openstackclient' 'python2-openstackclient'
              'python-pytest' 'python2-pytest'
              'python-pytest-xdist' 'python2-pytest-xdist')
source=("https://github.com/gnocchixyz/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('46cfe78ecba2f18424814452289de3e0ac40d0e8580f6e303616676aa5f145a8eea6df95aa24ca32cb26fba4adf954045c0c00d9a93f2c8b92bd4feb5ba5401b')

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

package_python-gnocchiclient() {
  depends=('python-pbr' 'python-cliff' 'python-ujson' 'python-keystoneauth1'
           'python-six' 'python-futurist' 'python-iso8601' 'python-monotonic'
           'python-dateutil' 'python-debtcollector')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-gnocchiclient() {
  depends=('python2-pbr' 'python2-cliff' 'python2-ujson' 'python2-keystoneauth1'
           'python2-six' 'python2-futurist' 'python2-iso8601' 'python2-monotonic'
           'python2-dateutil' 'python2-debtcollector')
  cd "${srcdir}/python-gnocchiclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/gnocchi{,2}
}

# vim:set ts=2 sw=2 et:
