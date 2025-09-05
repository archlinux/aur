
pkgname=chromium-ffmpeg-legacy-bin
_nw=0.100.1
pkgver=137.0.7151.69
pkgrel=2
_avcodec=61
pkgdesc="Add codecs to Chromium ( libavcodec ${_avcodec}, all Chromium patches)"
arch=('x86_64')
url=https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/
conflicts=(opera{,-beta}-ffmpeg-codecs ${pkgname%-bin})
provides=("${conflicts[@]}")
license=('LGPL-2.1-or-later')
install=opera-ffmpeg.install
source=($install opera-ffmpeg.hook
"${url}/releases/download/${_nw}/${_nw}-linux-x64.zip"
)
sha256sums=('8100be6868b0f6202302fd1045e5741fdb3c6be7ea41bb36a72a365979bef56c'
            'f85a68c58468eb0fa312ac94cc07b5f33b9d22f53c2d2bc9d888511fb7ca6c9f'
            'f97bd8f332bf1e5ac4f1d89f78c9dcfac9b2dbec9d02a29dfbb9d9d6c971e72e')

package() {
  _so=libffmpeg.so
  install -Dm644 $_so -t "${pkgdir}"/usr/lib/opera/lib_extra
  install -d "$pkgdir"/usr/lib/opera-beta/lib_extra
  ln -sf /usr/lib/opera/lib_extra/$_so "$pkgdir"/usr/lib/opera-beta/lib_extra
  # Block LD_PRELOAD breakage
  install -Dm644 opera-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
