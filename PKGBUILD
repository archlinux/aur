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

source=("https://github.com/XdaemonX/${_reponame}/blob/master/release-${pkgver}.tar.gz")
sha512sums=('c707ad4dc3adaf371587bb222021713024cb8157e4d4f88301a8c5ba0ae7ffbca605544c6ca70f67287f82e11600c372e725a02560e5f4d597f842063c381fdb')


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
