# Maintainer: novica <nnovica@gmail.com>

pkgname=arity
pkgver=0.22.0 # renovate: datasource=github-tags depName=jolars/arity
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

sha512sums=('b67f756061e1948a7bb70e62797942501f8b26de8ecd0f7f467ad4e72eb74feb371b0d7b2c2ff39c655c7594cf5630fe71575b7dfb69bb5956809d11c9abdb5a')
