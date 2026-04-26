# Maintainer: tocer <tocer@aur>
pkgname=eddy-audio
pkgver=0.0.1
pkgrel=1
pkgdesc="Fast, local-first speech recognition with OpenVINO (Parakeet TDT)"
arch=(x86_64)
url="https://github.com/FluidInference/eddy-audio"
license=(MIT)
depends=(openvino libsndfile libsamplerate)
makedepends=(cmake gcc)
provides=(eddy)
source=("$pkgname-$pkgver.tar.gz::https://github.com/FluidInference/eddy-audio/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c85e0196e2ecb569bac94c77e96107d3812c7c98b4a217625e18a8d6d09f65aa')

build() {
  cmake -B build -S "$pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DEDDY_BUILD_EXAMPLES=ON \
    -DEDDY_BUILD_CSHARP=OFF \
    -DEDDY_ENABLE_WHISPER=OFF
  cmake --build build -j"$(nproc)"
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
