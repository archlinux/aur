# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname='blink'
_reponame='blink-qt'
pkgver='3.0.3'
pkgrel='2'
pkgdesc='A state of the art, easy to use SIP client'
arch=('any')
url='http://icanblink.com'
license=('GPL3' 'FreeBSD')
depends=('icu'
         'libvncserver'
         'python2-application'
         'python2-gmpy2'
         'python2-gnutls'
         'python2-google-api-python-client'
         'python2-pyqt5'
         'python2-sipsimple>=3.1'
         'python2-zope-interface'
         'qt5-webkit'
         'qt5-svg')
optdepends=('python2-service-identity: for TLS certificate hostname verification')

source=("https://github.com/AGProjects/${_reponame}/archive/release-${pkgver}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('26bf454c1db3407c4f6c16e0edece31d2cbbbd4e45d61fd11eb319c695f8b277')

build() {
  cd ${srcdir}/${_reponame}-release-${pkgver}
  python2 setup.py build
}

package() {
  cd ${srcdir}/${_reponame}-release-${pkgver}
  python2 setup.py install --root="${pkgdir}"

  # license
  install -Dm644 LICENSE \
    ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

  # desktop file
  install -Dm644 ${srcdir}/${_reponame}-release-${pkgver}/debian/${pkgname}.desktop \
    ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
