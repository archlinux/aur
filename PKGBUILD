# Maintainer: johnpyp <johnpaulpenaloza@gmail.com>

pkgname=screenie-bin
_pkgname=screenie
pkgver=0.2.0
pkgrel=1
pkgdesc='Beautiful screenshots & screen recording for Wayland'
arch=('x86_64' 'aarch64')
url='https://github.com/johnpyp/screenie'
license=('MIT')
depends=(
  'fontconfig' # loaded at runtime, as are libglvnd, vulkan-icd-loader, wayland
  'glib2'
  'glibc'
  'gst-libav'            # AAC audio
  'gst-plugins-bad-libs' # h264parse, NVENC
  'gst-plugins-base-libs'
  'gst-plugins-good' # MP4 muxing, PulseAudio/PipeWire capture
  'gst-plugins-ugly' # x264, when there's no hardware encoder
  'gstreamer'
  'libgcc'
  'libglvnd'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'mesa'
  'vulkan-icd-loader'
  'wayland'
)
optdepends=(
  'gst-plugin-va: hardware-encoded recordings on AMD and Intel'
  'intel-media-driver: VA-API on Intel'
)
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source_x86_64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v$pkgver/$_pkgname-$pkgver-aarch64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('f21c7c5cf391f9957da30d1c1d85d7c9ef9b6e870afe81b6ac208ada5e6c1e06')
sha256sums_aarch64=('ae4b2cfff5669b03738331f8c14d40b7a484c366ccdfa7c82e7e5739707e2a8b')

package() {
  cd "$_pkgname-$pkgver-$CARCH-unknown-linux-gnu"
  install -Dm755 bin/screenie "$pkgdir/usr/bin/screenie"
  install -Dm644 -t "$pkgdir/usr/share/man/man1" share/man/man1/*
  install -Dm644 -t "$pkgdir/usr/share/man/man5" share/man/man5/*
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
