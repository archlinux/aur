# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kstogram
pkgver=2.0.0.1115
pkgrel=2
pkgdesc="Download and backup Instagram photos shared by any user."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-stogram"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'qt5-graphicaleffects' 'libexif' 'libjpeg9')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("${pkgname}_${pkgver}_i386.tar.bz2"::"http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_amd64.tar.bz2"::"http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('7970c1f1aacd5a546ca8252c2d48a874478a26e23eb57769f54c5feac7316f51'
            'b1add61c84f745911dee0672b25e021a3da0d90127843f3a814864858306ab8b')
sha256sums_i686=('057333859d6e3222fa5215057ac520fc5fa5829397deb25654924f522b062610')
sha256sums_x86_64=('b461e8614521dbd8980788257c193e5f7dc5b5115d8ec4f078cb23ef7933b2f6')

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  # Install files
  cd "${pkgname}"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}-bin"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/translation"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/translation" translation/*
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "doc/eula"
}
