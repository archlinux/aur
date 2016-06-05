# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kyoutubetomp3
pkgver=3.0.0.1616 
pkgrel=2
pkgdesc="Extract audio from YouTube, Vimeo, Facebook and other online video hosting services."
arch=('i686' 'x86_64')
url="http://www.4kdownload.com/products/product-youtubetomp3"
license=('custom:eula')
depends=('qt5-script' 'portaudio' 'ffmpeg2.8')
source=("${pkgname}.desktop"
        "${pkgname}.png")
source_i686=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_i386.tar.bz2")
source_x86_64=("http://downloads.4kdownload.com/app/${pkgname}_${pkgver%.*.*}_amd64.tar.bz2")
sha256sums=('386dfa4085efcd9403c4387c7be4dd0f9762c726555b5ebd0126dcd225bcf828'
            'b25f830bb1fe559ea9f0b35cc9eb8ab75e2e40d09b8755f937451f5ddeeec2fd')
sha256sums_i686=('96908a29673cc91123e07c412cd36710b40600f67cfa796e1e105eb44c886fc1')
sha256sums_x86_64=('e1654092ff32bc25b0d17b66d87c106c329705cb8332bcb82f002a00d0bb615f')

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
