# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix

pkgname=riprip
pkgver=0.5.9
pkgrel=1
pkgdesc="Specialized audio CD-ripper optimized for track recovery"
arch=(x86_64)
url="https://github.com/Blobfolio/riprip"
license=(WTFPL)
depends=(
    glibc
    libcdio
    libgcc
    )
makedepends=(
    git
    cargo
    clang
    )
options=(!lto)
source=("git+https://github.com/Blobfolio/riprip.git#tag=v${pkgver}")
sha256sums=('824a46b46b7fb63db3aac5364d3e8cedf6d89158d85f0aaa6a416e0e8d3bce27')

prepare() {
  cd riprip
  cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build() {
  cd riprip
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release
}

package() {
  cd riprip
  install -D target/release/riprip -t "${pkgdir}"/usr/bin
  install -D release/man/*.1 -t "${pkgdir}"/usr/share/man/man1/

  # todo install completions
}
