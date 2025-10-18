# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>
# Maintainer: Matthias Eberlein

pkgname=youtube-to-mp3
pkgver=3.9.17
pkgrel=1
build=251015
pkgdesc='Downloads audio from YouTube or Vimeo and saves it to mp3 or m4a format to listen to locally'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('LicenseRef-custom')
depends=('hicolor-icon-theme'
         'qt5-multimedia'
         'qt5-webengine'
         'qt5-declarative'
         'qt5-quickcontrols'
         'taglib1'
         'ffmpeg')
provide=('youtube-to-mp3')
conflicts=('youtube-to-mp3')
source_x86_64=("${pkgname}-${build}.amd64.deb::https://schinfo.de/MediaHuman/YouTubeToMP3.amd64.deb")
sha256sums_x86_64=('a027363c947c7c06338610436dc1596da6350ba8ce50fbf78265fd17b38a5cd2')

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
