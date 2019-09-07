# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>

pkgname=blink
_reponame=blink-qt
pkgver=3.2.0
pkgrel=1
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
         'python2-oauth2client'
         'python2-service-identity'
         'qt5-webkit'
         'qt5-svg')
optdepends=('python2-service-identity: for TLS certificate hostname verification'
            'x11vnc: for screen sharing')

source=("https://github.com/XdaemonX/blink-qt/releases/download/${pkgver}/release-${pkgver}.tar.gz")
sha512sums=('d492ef03c61facc6f1351f90a82ff0f3927b6a16ee6d6ac0799441dd7616a8c47b751acca65f25f9bea7efac878ae94d7facd81b26eb65e341a106692478238b')


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
