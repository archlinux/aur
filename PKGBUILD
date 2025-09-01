
pkgname=chromium-ffmpeg-legacy-bin
_nw=0.100.1
pkgver=137.0.7151.69
pkgrel=1
pkgdesc="Add codecs to Chromium ( libavcodec ${_avcodec}, all Chromium patches)"
arch=('x86_64')
url=https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/
conflicts=(opera{,-developer,-beta}-ffmpeg-codecs)
provides=("${conflicts[@]}")
license=('LGPL-2.1-or-later')
install=opera-ffmpeg.install
source=($install opera-ffmpeg.hook
"${url}/releases/download/${_nw}/${_nw}-linux-x64.zip"
)
sha256sums=('f243a58140022f927515cba982a2286894159eb0f5ea84992e904872007db820'
            '22a051909ed37d16a667074636a450114d8b95829cf890c4770f57485a6c3209'
            'f97bd8f332bf1e5ac4f1d89f78c9dcfac9b2dbec9d02a29dfbb9d9d6c971e72e')

package() {
  _so=libffmpeg.so
  install -Dm644 ${_so} -t "${pkgdir}"/usr/lib/opera/lib_extra
  install -d "$pkgdir"/usr/lib/opera-{beta,developer}/lib_extra
  for _f in "$pkgdir"/usr/lib/opera-{beta,developer}/lib_extra
    do ln -sf /usr/lib/opera/lib_extra/$_so "$_f/$_so"
  done
  # Block LD_PRELOAD breakage
  install -Dm644 opera-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
