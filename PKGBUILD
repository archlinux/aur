# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kslideshowmaker
pkgver=1.5.6.903
pkgrel=5
pkgdesc="A straightforward and easy-to-use app to create slideshows from music and photos, with Instagram support."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-slideshowmaker"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'libexif' 'portaudio' 'ffmpeg2.8' 'libjpeg9')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("${pkgname}_${pkgver}_i386.tar.bz2"::"http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_amd64.tar.bz2"::"http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('e77851c895f713a7f615010c0b62d0749254dac5178f9853ae45a915ac1f84f0'
            '8e14e4f39f5b794b56dfe7246723e62b59ab9d664330065847cc90654aee3468')
sha256sums_i686=('ddfe4a6143bd75115bb86a5ee21f3e666d7d20154708791e9f5added99b00b60')
sha256sums_x86_64=('3e7b6830f5e203e041b1224fd09231f5f352d84fd78d6824463bfe75e57c2b24')

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
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/audio"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/audio" audio/*
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/translation"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/translation" translation/*
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}-bin" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "doc/eula"
}
