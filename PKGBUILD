# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=gstreamer-svt-av1
pkgver=2.0.0
pkgrel=1
pkgdesc="This plugin provides svtav1enc element to GStreamer in order to use the Scalable Video Technology for AV1 Encoder (SVT-AV1)"
url="https://gitlab.com/AOMediaCodec/SVT-AV1/-/tree/master/gstreamer-plugin"
license=('BSD-3-Clause-Clear' 'custom: Alliance for Open Media Patent License 1.0')
arch=('x86_64')
provides=("libgstsvtav1enc.so")
depends=('gst-plugins-base-libs' 'svt-av1')
makedepends=('meson')
source=("SVT-AV1-v$pkgver.tar.bz2::https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v$pkgver/SVT-AV1-v$pkgver.tar.bz2?path=gstreamer-plugin"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/v$pkgver/LICENSE.md"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/v$pkgver/PATENTS.md")
sha256sums=('5eb5a828d162021fbe33a14e1eb01793a49040b13aa24b47fde1eda94bf444a0'
            '0acc2fcb27472bdc9aaf8b71f37055bbdac4f54671b7d922f241bd7fcd0dd3e6'
            '20678ab10402659106dc4c147c97b2a6e94b5c0695415e15a8f195ebc3547922')

build() {
  arch-meson SVT-AV1-v$pkgver-gstreamer-plugin/gstreamer-plugin build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE.md PATENTS.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
