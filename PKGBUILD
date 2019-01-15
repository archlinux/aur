# Maintainer: Andy Botting <andy@andybotting.com>

pkgname=('python-ceilometerclient'
         'python2-ceilometerclient')
pkgver='2.9.0'
pkgrel='3'
pkgdesc='Python client library for Ceilometer'
arch=('any')
url="http://docs.openstack.org/developer/${pkgname}/"
license=('Apache')
makedepends=('python-setuptools'
             'python2-setuptools')
checkdepends=('python-pbr' 'python2-pbr'
              'python-iso8601' 'python-iso8601'
              'python-keystoneauth1' 'python2-keystoneauth1'
              'python-oslo-i18n' 'python2-oslo-i18n'
              'python-oslo-serialization' 'python2-oslo-serialization'
              'python-oslo-utils' 'python2-oslo-utils'
              'python-prettytable' 'python2-prettytable'
              'python-requests' 'python2-requests'
              'python-six' 'python2-six'
              'python-stevedore' 'python2-stevedore'
              'python-mock' 'python2-mock'
              'python-subunit' 'python2-subunit'
              'python-tempest'
              'python-testrepository' 'python2-testrepository')
source=("https://github.com/openstack/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('9955f683a07a2a5d7a65abe0a5100a2773f7938b69613a7ce24edcf7f42cd22d5e8a232ea5fe720715d8a344d16abf07c5288a9820f208c4815956cffd4f2702')

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

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py testr

  cd "${srcdir}/${pkgname}-${pkgver}-py2"
  PYTHON=python2 python2 setup.py testr
}

package_python-ceilometerclient() {
  depends=('python-pbr'
           'python-iso8601'
           'python-keystoneauth1'
           'python-oslo-i18n'
           'python-oslo-serialization'
           'python-oslo-utils'
           'python-prettytable'
           'python-requests'
           'python-six'
           'python-stevedore')
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1
}

package_python2-ceilometerclient() {
  depends=('python2-pbr'
           'python2-iso8601'
           'python2-keystoneauth1'
           'python2-oslo-i18n'
           'python2-oslo-serialization'
           'python2-oslo-utils'
           'python2-prettytable'
           'python2-requests'
           'python2-six'
           'python2-stevedore')
  cd "${srcdir}/python-ceilometerclient-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  mv "${pkgdir}"/usr/bin/ceilometer{,2}
}

# vim:set ts=2 sw=2 et:
