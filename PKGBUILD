# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
pkgver=8.0
pkgrel=1
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium (libavcodec 62 from ffmpeg.org)"
arch=('x86_64')
depends=(glibc)
conflicts=({nwjs,vivaldi{,-snapshot}}-ffmpeg-codecs chromium-ffmpeg{,-legacy}
opera{,-developer,-beta}-ffmpeg-codecs)
provides=("${conflicts[@]}")
url=https://github.com/oech3/Chromium-FFmpeg/releases
license=('LGPL-2.1-or-later')
install=chromium-ffmpeg.install
source=($install chromium-ffmpeg.hook
"${url}/download/${pkgver%_*}/ffmpeg-${pkgver%_*}-linux-x64.tar.zst"
#"${url}/download/${pkgver#*_}/ffmpeg-${pkgver#*_}-linux-x64.tar.zst"
)
sha256sums=('684a839ddd1aa3a25a938cad68867341fd43be10a0a8cce59487353b471d6005'
            '6873b38d05e884f3f7fa1c2019ce380d717b3f95af75a1218fbd94a1054f65ad'
            '6dfcc8da692f3b0e9617d0cca0eb9e309bb54738153abb4f07d5c6e6fdefdffa')

package() {
  install -d "$pkgdir"{/usr/lib/opera{,-beta,-developer}/lib_extra,/opt/vivaldi{,-snapshot}}
  _avcodec=62
  mv ${_so}.$_avcodec "$pkgdir"/usr/lib
  ln -sf ${_so}.$_avcodec "$pkgdir"/usr/lib/$_so
  install -Dm644 chromium-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
  # Block DL and LD_PRELOAD
  touch "$pkgdir"/opt/vivaldi{,-snapshot}/${_so}.{7.5,7.6,7.7,7.8,7.9,8.0}
}
