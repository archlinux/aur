# Maintainer: queenbiscuit311 <sarahacv6002 At gmail Dot com>
# Credit to oech3 for information on how to switch source from snap to nwjs-ffmpeg-prebuilt and for 'disable-opera-default-ffmpeg.hook' as well as 'enable-opera-default-ffmpeg.install'

pkgname=opera-ffmpeg-codecs-bin
pkgver=135.0.7049.96
_nwjsver=0.98.2
pkgrel=1
epoch=1
pkgdesc="Additional support for proprietary codecs for opera using prebuilt FFmpeg binaries made for NW.js."
arch=('x86_64')
url="https://snapcraft.io/chromium-ffmpeg/"
options=('!debug')
license=('LGPL2.1')
depends=('opera')
provides=('opera-ffmpeg-codecs')
conflicts=('opera-ffmpeg-codecs')
makedepends=('unzip')
source=(
  "https://github.com/nwjs-ffmpeg-prebuilt/nwjs-ffmpeg-prebuilt/releases/download/0.98.2/0.98.2-linux-x64.zip"
  disable-opera-default-ffmpeg.hook
  enable-opera-default-ffmpeg.install
)
install=enable-opera-default-ffmpeg.install
sha512sums=('89db5a8afe5516bae2b8163d2d7370790d40206a87db3993e58ebc45add0aafea1fb8de6c46032357b1dab02b1ccdb7b736b61c2c0516f25766e05120674c4e0' '54c0fedd3abf83929ae8dae1d2cf4f5a356b1b9f026ba7a474cdf9f4d6ffcee5579b60a785235bb45ae93252a82bfe3b4a4a78c3707fc2696b8642a63386e552' '6e01cb8797a18748a596c69f0a9ece82016e1934d1963ef9385d655734d6c8506f7b916e608ed7f4746b2b9ef4f2c524f930244f335eb81ffce0def14f9d0d50')

prepare() {
  unzip "$_nwjsver-linux-x64.zip" -d extract
}

package() {
  install -Dm644 "$srcdir/extract/libffmpeg.so" "$pkgdir/usr/lib/opera/lib_extra/libffmpeg.so"
  install -Dm644 disable-opera-default-ffmpeg.hook -t "$pkgdir/usr/share/libalpm/hooks"
}
