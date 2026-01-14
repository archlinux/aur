# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>


pkgname=youtube-downloader-bin
_pkgname=youtube-downloader
pkgver=3.9.18
pkgrel=4
build=260104
pkgdesc='YouTube Downloader by MediaHuman'
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
provides=('youtube-downloader')
conflicts=('youtube-downloader')
source_x86_64=("${pkgname}-${pkgver}-${build}-${pkgrel}.amd64.deb::https://schinfo.de/MediaHuman/YouTubeDownloader.amd64.deb")
sha256sums_x86_64=('cf0b0532a2233aff07c83dfda31625f2861a83b54df74839483d70ada52f61cf')

pkgver() {
  bsdtar -xf control.tar.xz -C .
  actpkgverlong="$(cat "control" | grep "Version: ")"
  actpkgver=${actpkgverlong##*: }
  echo "$actpkgver"
}

package() {
  bsdtar -xf data.tar.xz -C ${pkgdir}/
  install -D "${pkgdir}/usr/share/doc/${_pkgname}/copyright" -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  install -dm755 $pkgdir/usr/bin
  ln -s /opt/$_pkgname/YouTubeDownloader "${pkgdir}/usr/bin/YouTubeDownloader"
}
