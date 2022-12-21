# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=google-lyra
pkgver=1.3.2
pkgrel=1
pkgdesc="A very low-bitrate codec for speech compression"
arch=('i686' 'x86_64')
url="https://github.com/google/lyra"
license=('apache')
depends=('gcc-libs')
makedepends=('bazel<6' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/lyra/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('03ab9de1651e84819f8fe37a510052cee9b22b3be9cfd4813c333651880170e4')


build() {
  cd "lyra-$pkgver"

  bazel \
    build \
    -c opt \
    lyra/cli_example:decoder_main \
    lyra/cli_example:encoder_main
}

check() {
  cd "lyra-$pkgver"

  #bazel \
  #  test \
  #  //:all
}

package() {
  cd "lyra-$pkgver"

  install -Dm755 "bazel-bin/lyra/cli_example/encoder_main" "$pkgdir/usr/bin/lyra_encoder"
  install -Dm755 "bazel-bin/lyra/cli_example/decoder_main" "$pkgdir/usr/bin/lyra_decoder"
}
