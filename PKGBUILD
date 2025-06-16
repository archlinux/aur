# Maintainer: The Khip Team (khipteam at protonmail dot com)

pkgname=khip
pkgver=0.4
pkgrel=1
pkgdesc="A native port of the Krisp noise-cancellation shipped by Discord"
arch=("x86_64")

depends=(fftw libsamplerate openblas)
makedepends=(ladspa meson python)

source=(
  "https://codeberg.org/khip/khip/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
  "https://cdn.discordapp.com/assets/krisp_browser_models/v1.0.11_1/model_32.kw"
)
sha256sums=(
  "87815d14c92e9c74d11c5d4db2be13da300ff1e25e8dfe8e1fea2c060bc9cded"
  "4c495d789c9c775069a43deadd73e0b6e460cb55ee2abe2c25bb5dcaaf7f28d5"
)

prepare() {
  cp model_32.kw $pkgname-$pkgver/
}

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
