# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=google-lyra
pkgver=1.3.0
pkgrel=1
pkgdesc="A very low-bitrate codec for speech compression"
arch=('i686' 'x86_64')
url="https://github.com/google/lyra"
license=('apache')
depends=('gcc-libs')
makedepends=('bazel' 'python-numpy')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/lyra/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('593ec3a92fdcd3cdcbc6760955fd2441110f001001fb5c60ad0a0e9796e487c1')


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
