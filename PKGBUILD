# Maintainer: Rui Ventura <rventura.pt@outlook.com>
pkgname=chiaki
pkgver=2.2.0
pkgrel=2
pkgdesc='Free and Open Source PS4 Remote Play Client'
arch=(x86_64)
url=https://git.sr.ht/~thestr4ng3r/chiaki
license=(custom)
provides=(chiaki)
depends=(ffmpeg gcc-libs qt5-multimedia qt5-svg opus 'openssl>=1.1' sdl2)
makedepends=(cmake protobuf python-setuptools python-protobuf)
optdepends=(
  'intel-media-driver: VA-API backend for Intel GPUs (>= Broadwell)'
  'libva-intel-driver: VA-API backend for Intel GPUs (<= Haswell)'
  'linux-firmware: VA-API support for Intel GPUs (>= Skylake)'
  'libva-mesa-driver: VA-API backend for AMD (>= Radeon HD R2000) and Nvidia (Nouveau, GeForce 8 -> GTX 750) GPUs'
  'libva-vdpau-driver: VDPAU-based backend for VA-API'
  'mesa-vdpau: VDPAU for AMD (>= Radeon R600) and Nvidia (Nouveau, GeForce 8 -> GTX 750) GPUs'
  'nvidia-utils: Proprietary VDPAU / Codec support for Nvidia GPUs'
)
source=("$url/refs/download/v$pkgver/$pkgname-v$pkgver-src.tar.gz")
sha256sums=('f406894f3c2d751961d58c1e27e81f1313a3fed3d1a33d3bf4d6092ce6575cf8')

build() {
  cmake -S "$srcdir/$pkgname" -B build -DCMAKE_INSTALL_PREFIX=/usr -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/$pkgname/LICENSES/"*
}
