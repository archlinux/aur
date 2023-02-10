# Maintainer: Jayvee Enaguas <harvettfox96@tilde.club>

pkgname=classic-colors
pkgver=1.0.1.20221210
pkgrel=2
pkgdesc="A simple image drawing and editing program in a look similar to MS Paint"
url="https://github.com/justinmeiners/classic-colors/"
arch=('x86_64' 'i686')
license=('GPL-2')
depends=('openmotif' 'libxpm')
makedepends=('imagemagick')
source=("https://tilde.club/~harvettfox96/files/archive/pkg/${pkgname}/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.desktop")
sha512sums=('9f54e18afa39cc1cb33701749a1049125474baa3493af90c2b8041d1d48e1a2f6eb2b48365deae134f4a21c896598d0166a12e7ca8e910b80b2b28d8fc27c6e8'
            '5e7bbd1ac5b58ae56e635893b8c670513c1f755585f680fe464f7f9e76285f97a7efeb40ced1334033a07eb411939a574ba81f1d72e809eca9408873a0fd5527')

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
  install -Dm644 icons/icon_app.png "${pkgdir}/usr/share/icons/hicolor/24x24/apps/${pkgname}.png"
  install -Dm644 icons/icon_app.xpm "${pkgdir}/usr/share/pixmaps/${pkgname}.xpm"
  install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
