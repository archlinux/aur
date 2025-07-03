
pkgname=opera-ffmpeg-vivaldi-symlink
_ff=7.1.x
pkgver=138.ffmpeg$_ff
pkgrel=2
_viva=7.5
#pkgdesc='Add codecs to Operas and vivaldi-snapshot'
pkgdesc='Broken package. No longer works on Opera browsers (M136-).'
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL-2.1-or-later')
source=(off-opera-bundled-ffmpeg.hook on-opera-ff.install)
install=on-opera-ff.install
sha256sums=('08bf8603cb7b1dfe69ca28b4843c29cc96fd1faf01b37f123f2194ac33ff47a4'
            'f243a58140022f927515cba982a2286894159eb0f5ea84992e904872007db820')
depends=(vivaldi-ffmpeg-codecs)
conflicts=(vivaldi-snapshot-ffmpeg-codecs)
provides=(opera-{,developer-,beta-}ffmpeg-codecs{,-bin} vivaldi-snapshot-ffmpeg-codecs)
package() {
  echo $pkgdesc
  install -d "${pkgdir}"/usr/lib
  ln -sf /opt/vivaldi/libffmpeg.so.$_viva "${pkgdir}"/usr/lib/libffmpeg.so
  install -d "$pkgdir/opt/vivaldi-snapshot"
  ln -svf /opt/vivaldi/libffmpeg.so.$_viva "$pkgdir"/opt/vivaldi-snapshot/libffmpeg.so.7.5
  # Opera has strange LD_PRELOAD
  install -Dm644 off-opera-bundled-ffmpeg.hook -t "$pkgdir"/usr/share/libalpm/hooks
}
