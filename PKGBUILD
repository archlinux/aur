# Maintainer: Jayvee Enaguas <harvettfox96@tilde.club>

pkgname=classic-colors
pkgver=1.0.1.20221210
pkgrel=1
pkgdesc="A simple image drawing and editing program in a look similar to MS Paint"
url="https://github.com/justinmeiners/classic-colors/"
arch=('x86_64' 'i686')
license=('GPL-2')
depends=('openmotif' 'libxpm')
source=("https://tilde.club/~harvettfox96/files/archive/pkg/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop"
        "${pkgname}.xpm")
sha512sums=('9f54e18afa39cc1cb33701749a1049125474baa3493af90c2b8041d1d48e1a2f6eb2b48365deae134f4a21c896598d0166a12e7ca8e910b80b2b28d8fc27c6e8'
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
