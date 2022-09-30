# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=google-lyra
pkgver=1.2.0
pkgrel=1
pkgdesc="A very low-bitrate codec for speech compression"
arch=('i686' 'x86_64')
url="https://github.com/google/lyra"
license=('apache')
depends=('gcc-libs')
makedepends=('bazel' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/lyra/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('2b6b3d2a3d9e1dc6f12b073cd0065b9d2012f51dc89445c904a14fad8177a197')


build() {
  cd "lyra-$pkgver"

  bazel \
    build \
    -c opt \
    :decoder_main \
    :encoder_main
}

check() {
  cd "lyra-$pkgver"

  #bazel \
  #  test \
  #  //:all
}

package() {
  cd "lyra-$pkgver"

  install -Dm755 "bazel-bin/encoder_main" "$pkgdir/usr/bin/lyra_encoder"
  install -Dm755 "bazel-bin/decoder_main" "$pkgdir/usr/bin/lyra_decoder"
}
