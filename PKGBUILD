# Maintainer: novica <nnovica@gmail.com>

pkgname=arity
pkgver=0.32.0 # renovate: datasource=github-releases depName=jolars/arity
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

sha512sums=('74f227ae499c6d144b880b8323610af42372f2a04ea275784f40a9449739309c6f559ae11c68d7021f909cd115119c32bf1053dfe5d90feeceda11e65f38aade')
