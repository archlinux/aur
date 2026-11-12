# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=frame-bin
pkgver=0.34.0
pkgrel=1
pkgdesc="FFmpeg GUI media conversion utility (binary release)"
arch=(x86_64)
url="https://github.com/66HEX/frame"
license=('GPL-3.0-only')
provides=("frame")
conflicts=("frame")
depends=("ffmpeg")
_pkgname=${pkgname%-bin}

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/66HEX/${_pkgname}/releases/download/${pkgver}/${_pkgname}-linux-x86_64.tar.gz")
sha256sums=('24c36da2d1836f30c45835d00b6338698d0b21f3fa67bff4f78b7e0a25982afc')

package(){
  install -dm755 "$pkgdir"/{opt/frame,usr/bin,usr/share/applications,usr/share/icons/hicolor}
  rm -f frame.app/bin/binaries/{ffmpeg,ffprobe}*
  cp -a frame.app "$pkgdir/opt/frame/"

  ln -s /usr/bin/ffmpeg "$pkgdir/opt/frame/frame.app/bin/binaries/ffmpeg"
  ln -s /usr/bin/ffprobe "$pkgdir/opt/frame/frame.app/bin/binaries/ffprobe"

  ln -s /opt/frame/frame.app/bin/frame "$pkgdir/usr/bin/frame"

  ln -s /opt/frame/frame.app/share/applications/Frame.desktop "$pkgdir/usr/share/applications/Frame.desktop"
  cp -a frame.app/share/icons/hicolor/* "$pkgdir/usr/share/icons/hicolor/"
}
