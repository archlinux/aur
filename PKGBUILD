# Maintainer: taotieren <admin@taotieren.com>

pkgbase=svdtools
pkgname=svdtools
pkgver=0.3.14
pkgrel=1
epoch=
pkgdesc="svdtools is a set of tools for modifying vendor-supplied, often buggy SVD files. It can be imported as a library for use in other applications, or run directly via the included svdtools CLI utility."
arch=(x86_64
  aarch64
  riscv64)
url="https://github.com/rust-embedded/svdtools"
license=('MIT', 'Apache-2.0')
groups=()
depends=(gcc-libs
  glibc)
makedepends=(
      cargo)
optdepends=('svd2rust: Generate Rust register maps (`struct`s) from SVD files')
provides=(svdtools svdtools-rust)
conflicts=(svdtools svdtools-rust)
replaces=(python-svdtools svdtools-rust)
backup=()
options=('!strip' '!lto')
install=
changelog=
source=("${pkgbase}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=('cd3dc6b0fe5b8fbbb4f4175283eefb133977a8bec5ba987c858c1e3b2d5e19db')
#validpgpkeys=()

export RUSTUP_TOOLCHAIN=stable
export CARGO_TARGET_DIR=target

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    cargo build --release --all-features
}

package() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    cargo install --no-track --all-features --root "$pkgdir/usr/" --path .
}
