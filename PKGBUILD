# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kslideshowmaker
pkgver=1.6.2.948
pkgrel=1
pkgdesc="A straightforward and easy-to-use app to create slideshows from music and photos, with Instagram support."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-slideshowmaker"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'libexif' 'portaudio' 'ffmpeg2.8' 'libjpeg9')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("${pkgname}_${pkgver}_i386.tar.bz2"::"https://downloads2.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://downloads2.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('e77851c895f713a7f615010c0b62d0749254dac5178f9853ae45a915ac1f84f0'
            '8e14e4f39f5b794b56dfe7246723e62b59ab9d664330065847cc90654aee3468')
sha256sums_i686=('5d243ecf5223af12cf8fbef89aa0338657a28c657320cf91a0e411e68bc596ab')
sha256sums_x86_64=('276df64c49bdd31c5cffd071af74ec6a53cf4eb1c8ca7378485f0277b2f10452')

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
