# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>


pkgname=youtube-downloader-bin
_pkgname=youtube-downloader
pkgver=3.9.11
pkgrel=1
pkgdesc='YouTube Downloader by MediaHuman'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('LicenseRef-custom')
depends=('hicolor-icon-theme'
         'qt5-multimedia'
         'qt5-webengine'
         'qt5-declarative'
         'taglib1'
         'ffmpeg')
provides=('youtube-downloader')
conflicts=('youtube-downloader')
source_x86_64=("${pkgname}-$(date +%F-%H).amd64.deb::https://schinfo.de/MediaHuman/YouTubeDownloader.amd64.deb")
sha256sums_x86_64=('8a5daea343917257c7db38aa7825f752a735998f5443e71f3b7ac4ba085b80f1')

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
