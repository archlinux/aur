# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=gstreamer-svt-av1
pkgver=1.8.0
pkgrel=1
pkgdesc="This plugin provides svtav1enc element to GStreamer in order to use the Scalable Video Technology for AV1 Encoder (SVT-AV1)"
url="https://gitlab.com/AOMediaCodec/SVT-AV1/-/tree/master/gstreamer-plugin"
arch=('x86_64')
license=(BSD 'custom: Alliance for Open Media Patent License 1.0')
depends=('gstreamer')
makedepends=('meson')
source=("https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v$pkgver/SVT-AV1-v$pkgver.tar.bz2?path=gstreamer-plugin"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/v$pkgver/LICENSE.md"
        "https://gitlab.com/AOMediaCodec/SVT-AV1/-/raw/v$pkgver/PATENTS.md")
sha256sums=('c548a5eb9ca6538c85b73f12d8ec49697a177e47deebd7fe477d769a0985c4bf'
            '0acc2fcb27472bdc9aaf8b71f37055bbdac4f54671b7d922f241bd7fcd0dd3e6'
            '20678ab10402659106dc4c147c97b2a6e94b5c0695415e15a8f195ebc3547922')

build() {
  arch-meson SVT-AV1-v$pkgver-gstreamer-plugin/gstreamer-plugin build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
  install -Dm644 LICENSE.md PATENTS.md -t "$pkgdir/usr/share/licenses/gstreamer-svt-av1"
}
