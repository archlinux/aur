# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=cargo-lbin
pkgver=0.10.1
pkgrel=1
pkgdesc='Cargo-powered application manager for crates.io command-line binaries'
url='https://github.com/sirlucjan/cargo-lbin'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo')
options=(!lto)
source=("git+https://github.com/sirlucjan/cargo-lbin?signed#tag=$pkgver")
sha256sums=('3e760f066a45b47c8afd578b14ec2b0e2b05a3e51f428280ad1cfa7f7b06636f')
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
