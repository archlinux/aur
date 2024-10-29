# Maintainer: Helmut Stult <hst[at]e-mail[dot]de>

pkgname=youtube-to-mp3-bin
_pkgname=youtube-to-mp3
pkgver=3.9.9.96
pkgrel=2
pkgdesc='YouTube to MP3 Converter by MediaHuman'
arch=('x86_64')
url="https://www.mediahuman.com/download.html"
license=('LicenseRef-custom')
depends=('hicolor-icon-theme'
         'qt5-multimedia'
         'qt5-webengine'
         'qt5-declarative'
         'taglib1')
provide=('youtube-to-mp3')
conflicts=('youtube-to-mp3')
source_x86_64=("${pkgname}-$(date +%F-%H).amd64.deb::https://www.mediahuman.com/download/YouTubeToMP3.amd64.deb")
sha256sums_x86_64=('52bde36e6cbab3d0fcf7f7f6690e9b7572674be6012f094ada833c3d3e956d69')

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
  ln -s /opt/$_pkgname/YouTubeToMP3 "${pkgdir}/usr/bin/YouTubeToMP3"
}
