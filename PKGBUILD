# Maintainer: Roy Vegard Ovesen <roy.vegard.ovesen at gmail dot com>

pkgname=baton
pkgver=0.2.0
pkgrel=1
pkgdesc="A mixer for the PreSonus Studio 1824c audio interface"
arch=("x86_64")
url=https://github.com/royvegard/baton
license=("BSD-2-Clause")
depends=("glibc" "gcc-libs" "alsa-lib")
makedepends=("cargo")
source=("${pkgname}-${pkgver}::https://github.com/royvegard/baton/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('271c88a343097d017e8721b033dddb72b59a9a9ce5b5b664dd3cb1e7b56cc17a')

prepare() {
  cd "${pkgname}-${pkgver}"
  cargo fetch --locked --target "$(rustc --print host-tuple)"
}

build() {
  cd "${pkgname}-${pkgver}"
  cargo build --frozen --release
}

package() {
  cd "${pkgname}-${pkgver}"
  cargo install --locked --no-track --root "${pkgdir}/usr" --path tui
  cargo install --locked --no-track --root "${pkgdir}/usr" --path gui
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
