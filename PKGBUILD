# Maintainer: nomisge <nomisge @ live . de>
# Contributor: chet <chetgurevitch @ protonmail . com>
# Contributor: teacher4711 <inverness1 @ gmx . de>
# Contributor: fheday <fheday @ gmail . com>
# Contributor: seishinryohosha <seishinryohosha @ gmail . com>
# Contributor: even <kessiapinheiro @ gmail . com>

pkgname=greenfoot
pkgver=3.9.0
pkgrel=1
pkgdesc="Educational software designed to make learning programming easy and fun."
arch=('any')
url="https://www.${pkgname}.org"
license=('GPL2' 'Apache' 'BSD' 'CPL' 'LGPL2' 'LGPL2.1' 'MIT' 'custom')
depends=('archlinux-java-run' 'java-runtime=21' 'java-environment=21' 'java-openjfx=21')
source=("https://www.${pkgname}.org/download/files/Greenfoot-linux-x64-${pkgver//.}.deb"
        "${pkgname}"
        "${pkgname}.desktop"
        "${pkgname}.xml")
sha256sums=('406f0241b1fc013aaed44d2e92d8c80780c9fa2787a1f130c17fbc84849d5f49'
            'fbc3ce24cceeadd5ef910582d1b4ea9cc4952187fd15aff7be66e22ac0407dd6'
            'b980d0084fbafbb3ea335bb3840d858898c692822f1c671969a91982e86c1b4f'
            'f1ea33e8289dfe31b9a0c4d88482a5ca5f75d663ba82ca986519f290e44789e4')
	    
prepare() {
  cd "${srcdir}"
  echo "Extracting archive ..."
  tar -xf data.tar.xz --exclude=usr/share/${pkgname}/jdk
  cd "usr/share/${pkgname}"
  find -type f -name "javafx-*" -delete
}

package() {
  cd "${srcdir}"

  mkdir -p "${pkgdir}/opt/${pkgname}"
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"

  cp -r "usr/share/${pkgname}" "${pkgdir}/opt"
#  cp -r usr/share/doc/Greenfoot/API "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname}.xml"
  install -Dm644 "usr/share/icons/hicolor/48x48/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/48x48/apps/${pkgname}.png"
  install -Dm644 "usr/share/icons/hicolor/256x256/apps/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname}.png"
  install -Dm644 usr/share/doc/Greenfoot/README.txt "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 usr/share/doc/Greenfoot/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/Greenfoot/THIRDPARTYLICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/THIRDPARTYLICENSE"
}
