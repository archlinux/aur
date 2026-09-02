# Maintainer: Piotr Górski <lucjan.lucjanov@gmail.com>

pkgname=cargo-lbin
pkgver=0.5.0
pkgrel=1
pkgdesc='Thin cargo-install wrapper targeting /usr/local/bin, crates.io only'
url='https://github.com/sirlucjan/cargo-lbin'
arch=('x86_64')
license=('MIT' 'Apache-2.0')
depends=('cargo')
options=(!lto)
source=("git+https://github.com/sirlucjan/cargo-lbin?signed#tag=$pkgver")
sha256sums=('8816f14b83ff38cc63b20fd1d7e80e9d6b1d4888200f10b75d5b8df4235b04c4')
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
