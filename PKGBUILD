
pkgname=opera-ffmpeg-vivaldi-symlink
pkgver=136.0.7103.113
pkgrel=1
pkgdesc='Proprietary codecs for Opera and vivaldi-snapshot'
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL2.1')
depends=( vivaldi-ffmpeg-codecs )
conflicts=( opera-{,developer-,beta-}ffmpeg-codecs{,-bin} vivaldi-snapshot-ffmpeg-codecs)
provides=("${conflicts[@]}")
package() {
  for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra
  do
    install -d "$p"
    ln -sf /opt/vivaldi/libffmpeg.so* "$p"/libffmpeg.so
  done
  install -d "$pkgdir/opt/vivaldi-snapshot"
  ln -sf /opt/vivaldi/libffmpeg.so* "$pkgdir"/opt/vivaldi-snapshot/libffmpeg.so.7.5
  echo Warning: 'opera-* needs to replace /usr/lib/libffmpeg.so directly instead of using lib_extra by unknown reason (dlopen-ed?)'.
}
