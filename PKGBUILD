# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=cargo-lbin
pkgver=0.20.0
pkgrel=1
pkgdesc='Cargo-powered application manager for crates.io command-line binaries'
url='https://github.com/sirlucjan/cargo-lbin'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo')
options=(!lto)
source=("git+https://github.com/sirlucjan/cargo-lbin?signed#tag=$pkgver")
sha256sums=('bc3c01e63fc8bfa18cfdabeded958226ee50b210fff079c827fd78bfe5b0a4b7')
validpgpkeys=(
 399521CE9D6D65B35EEF0F8C79AFA05ABDB26C5A  # Piotr Gorski <lucjan.lucjanov@gmail.com>
)

prepare() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --release --frozen
}

package() {
  cd $pkgname
  export RUSTUP_TOOLCHAIN=stable
  cargo install --no-track --frozen --root "$pkgdir/usr/" --path .
}
