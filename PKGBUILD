# Maintainer: nomisge <nomisge @ live . de>
# Contributor: chet <chetgurevitch @ protonmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: seishinryohosha <seishinryohosha @ gmail . com>
# Contributor: even <kessiapinheiro @ gmail . com>

pkgname=greenfoot
pkgver=3.8.2
pkgrel=1
pkgdesc="Educational software designed to make learning programming easy and fun."
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2' 'LGPL2.1' 'MIT' 'custom')
depends=('archlinux-java-run' 'java-runtime=17' 'java-environment=17' 'java-openjfx=17')
source=("https://www.${pkgname}.org/download/files/Greenfoot-linux-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
#noextract=("Greenfoot-linux-${pkgver//.}.deb")
sha256sums=('c299a05adc768d30e3b7eee9e8772353fbb2d4f4669c01e9275ace61bfa157e5'
            '81caabbb2930d95414e5da3a8427b44dc5e338d192236c0c86be3ea344016189'
            'b980d0084fbafbb3ea335bb3840d858898c692822f1c671969a91982e86c1b4f'
            'f1ea33e8289dfe31b9a0c4d88482a5ca5f75d663ba82ca986519f290e44789e4')
prepare(){
  cd "${srcdir}"
  echo "Extracting archive ..."
  tar -xf data.tar.xz --exclude=usr/share/${pkgname}/{javafx,jdk}
#  ar p "Greenfoot-linux-${pkgver//.}.deb" data.tar.xz | tar xJ --exclude=usr/share/${pkgname}/{javafx,jdk}
  cd "usr/share/${pkgname}"
#  find -type f -name "javafx-*" -delete
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
  cp -r usr/share/doc/Greenfoot/API "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 usr/share/doc/Greenfoot/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/doc/Greenfoot/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/Greenfoot/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
