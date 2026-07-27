# Maintainer: Incognitux <incognitux at proton mail dot com>

pkgname=frame-bin
pkgver=0.32.0
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
sha256sums=('a7ea614456b184cfbceaf841f697e1bff313e6f774fc539b8aa007115cf7bc55')

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
