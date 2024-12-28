# Maintainer: taotieren <admin@taotieren.com>

pkgbase=svdtools
pkgname=svdtools
pkgver=0.3.20
pkgrel=1
epoch=
pkgdesc="svdtools is a set of tools for modifying vendor-supplied, often buggy SVD files. It can be imported as a library for use in other applications, or run directly via the included svdtools CLI utility."
arch=($CARCH)
url="https://github.com/rust-embedded/svdtools"
license=('MIT AND Apache-2.0')
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
sha256sums=('15926944f5d0692ef070eaca67a8a2d634e8634fd698dc7fb070139caf72b0e0')
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
