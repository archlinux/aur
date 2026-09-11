# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=cargo-lbin
pkgver=0.11.0
pkgrel=1
pkgdesc='Cargo-powered application manager for crates.io command-line binaries'
url='https://github.com/sirlucjan/cargo-lbin'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo')
options=(!lto)
source=("git+https://github.com/sirlucjan/cargo-lbin?signed#tag=$pkgver")
sha256sums=('984863fae15b53afea0cc3f297221d9fd2d9bb23eb8c30d86297b757bf33fc80')
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
