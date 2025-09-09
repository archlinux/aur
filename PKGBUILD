
pkgname=chromium-ffmpeg-legacy-bin
epoch=1
pkgver=7.1.2
pkgrel=0 #pre release
_avcodec=61
pkgdesc="Add codecs to Chromium 137- (libavcodec ${_avcodec})"
arch=('x86_64')
url=https://github.com/oech3/Chromium-FFmpeg/
conflicts=(opera{,-beta}-ffmpeg-codecs ${pkgname%-bin})
provides=("${conflicts[@]}")
license=('LGPL-2.1-or-later')
install=opera-ffmpeg.install
source=($install opera-ffmpeg.hook
${url}releases/download/${pkgver}/ffmpeg-${pkgver}-linux-x64.tar.zst

)
sha256sums=('8100be6868b0f6202302fd1045e5741fdb3c6be7ea41bb36a72a365979bef56c'
            'f85a68c58468eb0fa312ac94cc07b5f33b9d22f53c2d2bc9d888511fb7ca6c9f'
            '042882f5fe987b76137d1291344e46879fc6cf6cf7bc554aedc6d8685294e315')

package() {
  _so=libffmpeg.so
  install -Dm644 ${_so}.$_avcodec "${pkgdir}"/usr/lib/opera/lib_extra/$_so
  install -d "$pkgdir"/usr/lib/opera-beta/lib_extra
  ln -sf /usr/lib/opera/lib_extra/$_so "$pkgdir"/usr/lib/opera-beta/lib_extra
  # Block LD_PRELOAD breakage
  install -Dm644 opera-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
