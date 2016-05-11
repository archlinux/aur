# Mantainer: MCMic <come@chilliet.eu>

pkgname=llanfair
pkgver=1.4.3
pkgrel=1
pkgdesc="Split software for speedrunners"
arch=('any')
url="http://jenmaarai.com/llanfair/"
license=('custom')
depends=('java-runtime')
makedepends=('gendesk')
source=("http://share.jenmaarai.com/llanfair/llanfair_${pkgver}_any.zip")
md5sums=('5aa80ac43a038b338403105e911a0546')
_name='Llanfair'
_categories='Utility'

prepare() {
  gendesk -n -f ../PKGBUILD
}

build() {
  cd ${srcdir}/
  unzip -o Llanfair.jar res/Llanfair.png
}

package() {
  cd ${srcdir}/
  mkdir -p ${pkgdir}/usr/share/java/${pkgname}
  mkdir -p ${pkgdir}/usr/bin/
  mkdir -p ${pkgdir}/usr/share/icons/hicolor/64x64/apps/

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  cp res/Llanfair.png ${pkgdir}/usr/share/icons/hicolor/64x64/apps/${pkgname}.png
  cp -a lib Llanfair.jar ${pkgdir}/usr/share/java/${pkgname}/
  
  echo -e "#!/bin/sh\nmkdir -p ~/.config/llanfair\ncd ~/.config/llanfair\nexec /usr/bin/java -jar '/usr/share/java/${pkgname}/Llanfair.jar' \$@" > ${pkgdir}/usr/bin/${pkgname}
  chmod +x ${pkgdir}/usr/bin/${pkgname}
}
