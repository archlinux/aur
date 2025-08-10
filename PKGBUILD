# Maintainer: oech3
pkgname=chromium-ffmpeg-bin
_nw=0.102.0
pkgver=7.1.git.nw$_nw # should be replaced to ffmpeg.org build
pkgrel=1
_avcodec=62
_so=libffmpeg.so
pkgdesc="Add codecs to Chromium M138+ (libavcodec ${_avcodec})"
arch=('x86_64')
optdepends=(nwjs": manually ln -sf /usr/lib/${_so}.${_avcodec}. Do not LD_PRELOAD!")
conflicts=(vivaldi{,-snapshot}-ffmpeg-codecs chromium-ffmpeg)
provides=("${conflicts[@]}")
url=https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt
license=('LGPL-2.1-or-later')
source=("${url}/releases/download/${pkgver}/${_nw}-linux-x64.zip")
sha256sums=('a3d5eca356d145f18985fd1c7d64b5b12e8536e825d5b6c8dbb2739f5617a8dc')

package() {
  install -Dm644 $_so "$pkgdir"/usr/lib/${_so}.$_avcodec
  install -d "${pkgdir}"/opt/vivaldi{,-snapshot}
  for _n in 7.5 7.6 7.7 7.8 7.9 8.0 ; do
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi/${_so}.$_n
    ln -svf /usr/lib/${_so}.${_avcodec} "$pkgdir"/opt/vivaldi-snapshot/${_so}.$_n
  done
}
