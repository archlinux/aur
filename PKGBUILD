# shellcheck shell=bash
# Repository and checksum are filled by packaging/update-pkgbuild.py.
# They intentionally remain invalid until a real GitHub release exists.
pkgname=snipline
pkgver=0.1.0
pkgrel=1
pkgdesc='Wayland screenshot, recording, QR and OCR selector'
arch=('x86_64')
url='https://github.com/lufimio/snipline'
license=('MIT')
depends=('curl'
  'gcc-libs' 'glibc'
  'qt6-base>=6.5' 'qt6-declarative' 'qt6-wayland' 'qt6-svg'
  'layer-shell-qt' 'wayland' 'grim'
  'gstreamer>=1.20' 'gst-plugins-base-libs' 'gst-plugins-base' 'gst-plugins-good'
  'gst-plugins-ugly' 'gst-libav' 'libpulse' 'zxing-cpp>=2.0'
)
makedepends=('cmake>=3.24' 'ninja' 'pkgconf' 'wayland-protocols>=1.41' 'hyprland-protocols>=0.8')
optdepends=(
  'tesseract: OCR recognition'
  'ffmpeg: GIF export'
  'gst-plugins-bad: optional hardware encoders and additional codecs'
)
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('6bf450881c299b6190af574222ec5e68f235430e4e3017d57b53ff98292c6f0a')

build() {
  cmake -S "$srcdir/$pkgname-$pkgver" -B "$srcdir/build" -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=OFF
  cmake --build "$srcdir/build"
}

package() {
  DESTDIR="$pkgdir" cmake --install "$srcdir/build"
}
