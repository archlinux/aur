# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideotomp3
pkgver=2.4.1.873
pkgrel=1
pkgdesc="Extract audio in high-quality MP3 from any video."
arch=('x86_64')
url="http://www.4kdownload.com/products/product-videotomp3"
license=('custom:eula')
depends=('qt5-script' 'qt5-quickcontrols' 'portaudio' 'ffmpeg2.8')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.png")
sha256sums=('caad1749456f2bbdb980d106ab4c202b9c0e88b9ae4b1e98e9f5b07ad32053d4'
            'a53e776426f30fd1d35b5d78df95f3608f25a8637a7c5f0c731ff538226c2185'
            '3aa5efcf8111c63fde7397f491d2b85ff47d50fd531f7792842d94016b814a4c')

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
