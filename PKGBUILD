# Maintainer: Erhad Husovic <xdaemonx[at]protonmail[dot]ch>

pkgname=blink
pkgver=3.2.0
pkgrel=4
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

	  # https://github.com/AGProjects/blink-qt/archive/release-3.2.0.tar.gz
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/blink-qt/archive/release-${pkgver}.tar.gz")
sha256sums=('911d5232beb2b8638d26314ef9ab0831c67731bd5bd219c84668f30f3c849b4b')


build() {
  cd "${srcdir}/${pkgname}-qt-release-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-qt-release-${pkgver}"
  python2 setup.py install --root="${pkgdir}"

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # desktop file
  install -Dm644 "${srcdir}/${pkgname}-qt-release-${pkgver}/debian/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
