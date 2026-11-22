pkgname=snipline-bin
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland screenshot, recording, QR and OCR selector (prebuilt binary)'
arch=('x86_64')
url='https://github.com/lufimio/snipline'
license=('MIT')
provides=("snipline=$pkgver")
conflicts=('snipline')
depends=(
  'curl' 'gcc-libs' 'glibc'
  'qt6-base>=6.5' 'qt6-declarative' 'qt6-wayland' 'qt6-svg'
  'layer-shell-qt' 'wayland' 'grim'
  'gstreamer>=1.20' 'gst-plugins-base-libs' 'gst-plugins-base'
  'gst-plugins-good' 'gst-plugins-ugly' 'gst-libav' 'libpulse'
  'zxing-cpp>=2.0'
)
optdepends=(
  'tesseract: OCR recognition'
  'ffmpeg: GIF export'
  'gst-plugins-bad: optional hardware encoders and additional codecs'
)
options=('!strip' '!debug')
# This is the prebuilt Arch package published by the Release workflow.
source=("snipline-$pkgver-1-$CARCH.pkg.tar.zst::$url/releases/download/v$pkgver/snipline-$pkgver-1-$CARCH.pkg.tar.zst")
sha256sums=('d4b7e5a369b7bab3e0cb6459ed2f26a7b82da58ba7ac43388076a9deecac07a0')

package() {
  # Include binaries, assets and license, but not the original package metadata.
  cp -a "$srcdir/usr" "$pkgdir/"
  mv "$pkgdir/usr/share/licenses/snipline" "$pkgdir/usr/share/licenses/$pkgname"
}
