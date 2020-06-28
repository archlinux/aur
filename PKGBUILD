# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kslideshowmaker
pkgver=1.8.2.1041
pkgrel=1
pkgdesc="A straightforward and easy-to-use app to create slideshows from music and photos, with Instagram support."
arch=('x86_64')
url="http://www.4kdownload.com/products/product-slideshowmaker"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'libexif' 'portaudio' 'ffmpeg2.8'
         'libjpeg9' 'openssl-1.0')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('2c87658444df5451f04ca8d4daaa534c93e4684689721389ae8382065e40d361'
            'e77851c895f713a7f615010c0b62d0749254dac5178f9853ae45a915ac1f84f0'
            '8e14e4f39f5b794b56dfe7246723e62b59ab9d664330065847cc90654aee3468')

prepare() {
  cd "${pkgname}"
  # Remove insecure RPATH
  chrpath --delete "${pkgname}-bin"
}

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
