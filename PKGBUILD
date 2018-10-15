# Maintainer: Nils Czernia <nils[at]czserver[dot]de>

pkgname=blink
_reponame=blink-qt
pkgver=3.1.0
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
sha512sums=('fadb79a19ad4dd315c4c54579438605a5b90e49ce8f18934561e9c5ae0aff3c46e7a2842fc0bdf3e7d70f17d56d502494c5a9aef0b07fa13ed5e824cf4169fd3')


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
