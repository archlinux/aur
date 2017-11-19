# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideotomp3
pkgver=2.4.0.863
pkgrel=1
pkgdesc="Extract audio in high-quality MP3 from any video."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-videotomp3"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'portaudio' 'ffmpeg2.8')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("${pkgname}_${pkgver}_i386.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_i386.tar.bz2")
source_x86_64=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2")
sha256sums=('a53e776426f30fd1d35b5d78df95f3608f25a8637a7c5f0c731ff538226c2185'
            '3aa5efcf8111c63fde7397f491d2b85ff47d50fd531f7792842d94016b814a4c')
sha256sums_i686=('6396784d7dcc13e36cc32cc5550c04489110550bff652c1098b06d8b1fb429ab')
sha256sums_x86_64=('dd47fa08c19ca78dab7e7c999226e45ed074cd5ed3b5579b3814c5e79a559f9f')

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
