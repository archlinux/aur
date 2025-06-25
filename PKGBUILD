
pkgname=opera-ffmpeg-vivaldi-symlink
pkgver=136.0.7103.113
pkgrel=3
_viva=7.4
pkgdesc='Add codecs to Operas and vivaldi-snapshot'
arch=('x86_64')
url='https://chromium.googlesource.com/chromium/third_party/ffmpeg'
license=('LGPL2.1')
depends=(vivaldi-ffmpeg-codecs)
conflicts=(vivaldi-snapshot-ffmpeg-codecs)
provides=("${conflicts[@]}" opera-{,developer-,beta-}ffmpeg-codecs{,-bin})
package() {
  install -d "${pkgdir}"/usr/lib
  ln -sf /opt/vivaldi/libffmpeg.so.$_viva "${pkgdir}"/usr/lib/libffmpeg.so # NoExtract support
  #for p in "${pkgdir}"/usr/lib/opera{,-developer,-beta}/lib_extra
  #do
  #  install -d "$p"
  #  ln -sf /opt/vivaldi/libffmpeg.so.$_viva "$p"/libffmpeg.so
  #done
  install -d "$pkgdir/opt/vivaldi-snapshot"
  ln -sf /opt/vivaldi/libffmpeg.so.$_viva "$pkgdir"/opt/vivaldi-snapshot/libffmpeg.so.7.5
  ln -sf /opt/vivaldi/libffmpeg.so.$_viva "$pkgdir"/opt/vivaldi-snapshot/libffmpeg.so.7.6
  echo Warning: opera\* needs NoExtract=usr/lib/opera\*/libffmpeg.so since lib_extra does not work.
}
