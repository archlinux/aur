# Maintainer: novica <nnovica@gmail.com>

pkgname=arity
pkgver=0.18.0 # renovate: datasource=github-tags depName=jolars/arity
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

sha512sums=('c9ca50f8c0aece96639c4766bab4497402e454f73402b4780d2093f24f566d1f28bac58772858392639a384ccc2869460dada3377f5ce244eb0b86c060ec8201')
