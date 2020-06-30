# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=downline-bin
pkgver=1.3.1
pkgrel=2
pkgdesc='A cross-platform video and audio downloader for YouTube, Vimeo, Dailymotion, SoundCloud and many other sites'
arch=('x86_64')
url='https://jarbun.github.io/downline'
license=('unknown')
depends=('youtube-dl'
         'ffmpeg'
         'libxss'
         'nss'
         'gtk3'
         'libcups')
makedepends=('gendesk')
provides=('downline')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/jarbun/downline/releases/download/v${pkgver}/downline-${pkgver}-portable-linux.tar.xz"
        'downline.png')
sha256sums=('146c35492675cbbe03c1a80ee56716778c45101d42fdbc225545eff50ae01ce4'
            'SKIP')

package() {
  rm "${pkgname%-bin}/resources/youtube-dl/youtube-dl"
  rm "${pkgname%-bin}/resources/ffmpeg/ffmpeg"
  rm "${pkgname%-bin}/resources/ffmpeg/ffprobe"
  ln -s /usr/bin/youtube-dl "${pkgname%-bin}/resources/youtube-dl/youtube-dl"
  ln -s /usr/bin/ffmpeg "${pkgname%-bin}/resources/ffmpeg/ffmpeg"
  ln -s /usr/bin/ffprobe "${pkgname%-bin}/resources/ffmpeg/ffprobe"
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" \
   "${pkgdir}/usr/share/applications" \
   "${pkgdir}/usr/share/pixmaps"
  mv -v downline "${pkgdir}/opt"
  ln -s /opt/downline/downline "${pkgdir}/usr/bin"
  install -Dm644 downline.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
  gendesk -f -n --pkgname "${pkgname%-bin}" \
          --pkgdesc "$pkgdesc" \
          --name "Downline" \
          --comment "$pkgdesc" \
          --exec "${pkgname%-bin}" \
          --categories 'Utility;Audio;AudioVideo' \
          --icon "${pkgname%-bin}"
  install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}
# vim:set ts=2 sw=2 et: