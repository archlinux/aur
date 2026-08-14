# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=flaca
pkgver=3.9.1
pkgrel=1
pkgdesc="Specialized audio CD-ripper optimized for track recovery"
arch=(x86_64)
url="https://github.com/Blobfolio/flaca"
license=(WTFPL)
depends=(
    glibc
    libgcc
    )
makedepends=(
    git
    cargo
    clang
    )
options=(!lto)
source=("git+https://github.com/Blobfolio/flaca.git#tag=v${pkgver}")
sha256sums=('c89fb45031f287fee6353efdf654613983891f37d3447ff0681262d1ed4662dc')

prepare() {
  cd flaca
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd flaca
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release
}

package() {
  cd flaca
  install -D target/release/flaca -t ${pkgdir}/usr/bin
  install -D release/man/*.1 -t "${pkgdir}"/usr/share/man/man1/
  #install -D release/completions/flaca.bash -t "${pkgdir}"/usr/share/bash-completion/completions/

  # todo install completions
}
