# Maintainer: Jayvee Enaguas <harvettfox96@tilde.club>

pkgname=classic-colors
pkgver=20220508
pkgrel=1
pkgdesc="A simple image drawing and editing in a look similar to MS Paint"
url="https://github.com/justinmeiners/classic-colors/"
arch=('x86_64' 'i686')
license=('GPL-2')
depends=('openmotif' 'libxpm')
source=("https://tilde.club/~harvettfox96/files/archive/pkg/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.xpm")
sha512sums=('a6f5fc588356e72fc0b20a271be9ee67da70b091934241db261512b169f08f0992ddb15c23e3272f59c0ed307c313429dfe6a88451e4b27d5e167adb40e80740'
            '3ea147b70e7c2246def29965e6cb1e97a849680c1c07f5e5e214df3fb905db508472c02364af62898896e94f349b5645477333a9111293eed9c89fb2d226695c'
            'eea5f2366398727bea12aa14b36eb16a5567b9d940dc4e2062bd70cbeeed6b957d64869407900d740d9d4627f17c5c5ef31215384e39640268bcba6fa1f48e8a')

build() {
  cd ${pkgname}-${pkgver}

  ./configure
  sed -i 's#\"/usr/local#\"/usr#' ui_main.c

  make
}

package(){
  cd ${pkgname}-${pkgver}

  install -Dm755 bin/${pkgname} -t "${pkgdir}/usr/bin"
  install -Dm644 help/* -t "${pkgdir}/usr/share/${pkgname}/help"
  install -Dm644 ${srcdir}/${pkgname}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm644 ${srcdir}/${pkgname}.xpm -t "${pkgdir}/usr/share/pixmaps"
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
