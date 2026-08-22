# Maintainer: novica <nnovica@gmail.com>

pkgname=arity
pkgver=0.20.0 # renovate: datasource=github-tags depName=jolars/arity
pkgrel=1
pkgdesc="Language server, formatter, and linter for R"
url="https://github.com/jolars/arity"
arch=('x86_64' 'aarch64')
license=('MIT')
depends=(
    libgcc
    glibc
)
conflicts=('arity-bin')
optdepends=()
makedepends=('rust')
options=('!lto' '!debug')
source=("arity-${pkgver}.tar.gz::https://github.com/jolars/arity/archive/v${pkgver}.tar.gz")

prepare() {
    cd "${srcdir}/arity-${pkgver}"
    cargo fetch --locked
}

build() {
  cd "${srcdir}/arity-${pkgver}"

  cargo build --release --locked
}

package() {
  install -Dm755 "${srcdir}/arity-${pkgver}/target/release/arity"  "${pkgdir}/usr/bin/arity"
  install -Dm644 "${srcdir}/arity-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

sha512sums=('4e2bf4bb3be73202f68d6dadaf15106d4c4c4a5ce41ebe21d4e790d6327dad778b7d424184c845c053d5ea9e6acdfbaea7c1e028afa95c0685326f51a1d9332f')
