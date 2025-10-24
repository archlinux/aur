# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Maintainer: Matthias Eberlein

pkgname=youtube-to-mp3
pkgver=3.9.17
pkgrel=3
build=251021
pkgdesc='Downloads audio from YouTube or Vimeo and saves it to mp3 or m4a format to listen to locally'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('LicenseRef-custom')
depends=('ffmpeg'
         'hicolor-icon-theme'
         'qt5-declarative'
         'qt5-multimedia'
         'qt5-networkauth'
         'qt5-quickcontrols'
         'qt5-webengine'
         'taglib1')
provide=('youtube-to-mp3')
conflicts=('youtube-to-mp3')
source_x86_64=("${pkgname}-${pkgver}-${build}-${pkgrel}.amd64.deb::https://schinfo.de/MediaHuman/YouTubeToMP3.amd64.deb")
sha256sums_x86_64=('5de6ff6ac2e3f2dab5a924b0da90abe99e542a4080222943cf3817688dc29795')

pkgver() {
  bsdtar -xf control.tar.xz -C .
  actpkgverlong="$(cat "control" | grep "Version: ")"
  actpkgver=${actpkgverlong##*: }
  echo "$actpkgver"
}

package() {
  bsdtar -xf data.tar.xz -C ${pkgdir}/
  install -D "${pkgdir}/usr/share/doc/${pkgname}/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm755 $pkgdir/usr/bin
  ln -s /opt/$pkgname/YouTubeToMP3 "${pkgdir}/usr/bin/YouTubeToMP3"
}
