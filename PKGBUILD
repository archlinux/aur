# Maintainer: "Amhairghin" Oscar Garcia Amor (https://ogarcia.me)

pkgname='blink'
_reponame='blink-qt'
pkgver='2.0.0'
pkgrel='1'
pkgdesc='A state of the art, easy to use SIP client'
arch=('any')
url='http://icanblink.com'
license=('GPL3' 'FreeBSD')
depends=('cython2'
         'icu'
         'libvncserver'
         'python2-application'
         'python2-cjson'
         'python2-eventlib'
         'python2-gmpy2'
         'python2-gnutls'
         'python2-pyqt4'
         'python2-sip'
         'python2-sipsimple'
         'python2-zope-interface')

source=("https://github.com/AGProjects/${_reponame}/archive/release-${pkgver}/${_reponame}-${pkgver}.tar.gz")
sha256sums=('28cb43a4030eed444c45af8bbc627b8fe60523847c1db53337f4d4ebbd8bca2a')

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
