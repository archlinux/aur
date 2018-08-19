# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname=blink
_reponame=blink-qt
pkgver=3.0.3
pkgrel=5
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
optdepends=('python2-service-identity: for TLS certificate hostname verification'
            'x11vnc: for screen sharing')

source=("https://github.com/AGProjects/${_reponame}/archive/release-${pkgver}.tar.gz")
sha512sums=('bf00da76662de27a968e8c9f4f14eaa6292b0bde26a82adfb47f4b90cdfae5816a6c3296ace564c7112cb4a44918035f7fd10095937c3f4cf78e4eee517d791e')

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
