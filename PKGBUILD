# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=google-lyra
pkgver=0.0.2
pkgrel=1
pkgdesc="A very low-bitrate codec for speech compression"
arch=('i686' 'x86_64')
url="https://github.com/google/lyra"
license=('apache')
depends=('gcc-libs')
makedepends=('bazel')
source=("$pkgname-$pkgver.tar.gz::https://github.com/google/lyra/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4a86c9dde6b116c0057318b4537022b39c786b99fea6c85d4f0245b870c09a21')


build() {
  cd "lyra-$pkgver"

  # does not work with ccache
  #export CC="/usr/bin/gcc"
  #export CXX="/usr/bin/g++"

  bazel \
    build \
    -c opt \
    :encoder_main \
    :decoder_main
}

check() {
  cd "lyra-$pkgver"

  #bazel test //:all
}

package() {
  cd "lyra-$pkgver"

  install -Dm755 "bazel-bin/encoder_main" "$pkgdir/usr/bin/lyra_encoder"
  install -Dm755 "bazel-bin/decoder_main" "$pkgdir/usr/bin/lyra_decoder"
}
