# Maintainer: Cleboost <clement.balarot@gmail.com>
# Contributor: missing-aur project <https://github.com/Cleboost/missing-aur>

pkgname=glitchtip-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Open source CLI for GlitchTip"
url="https://gitlab.com/glitchtip/glitchtip-cli"
arch=("x86_64" "aarch64")
depends=("gcc-libs" "glibc")
makedepends=("cargo")
provides=("glitchtip-cli")
conflicts=("glitchtip-cli-bin")
license=("MIT")

source=("glitchtip-cli-${pkgver}.tar.gz::${url}/-/archive/v${pkgver}/glitchtip-cli-v${pkgver}.tar.gz")
sha256sums=('18a5a1cc0ac32e5a2c5cdca186a0a2443b0b2c8ecac580ffee66673b9ba42169')

prepare() {
  cd "${srcdir}/glitchtip-cli-${pkgver}"
  cargo fetch
}

build() {
  cd "${srcdir}/glitchtip-cli-${pkgver}"
  export CARGO_HOME="${srcdir}/cargo"
  cargo build --release
}

package() {
  cd "${srcdir}/glitchtip-cli-${pkgver}"
  install -Dm755 "target/release/glitchtip-cli" "${pkgdir}/usr/bin/glitchtip-cli"
}

