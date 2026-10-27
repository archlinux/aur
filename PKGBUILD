# Maintainer: Matthias Eberlein

pkgname=youtube-to-mp3
pkgver=3.9.24
pkgrel=2
_build=260709
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
         'taglib')
provides=('youtube-to-mp3')
conflicts=('youtube-to-mp3')
source_x86_64=("youtube-to-mp3.deb::https://www.mediahuman.com/de/download/YouTubeToMP3.amd64.deb")
sha256sums_x86_64=('8581f47cff9a3646892a79b3c0a796305220b834afb8d81f56cda8a3db88ac3f')

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
