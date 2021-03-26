# Maintainer: BlindingDark <blindingdark@outlook.com>

pkgname=wordninja-rs-lua-git
_pkgname=wordninja-rs-lua
pkgver=b2f252a
pkgrel=1
pkgdesc="Wordninja Rust lua native module."
url="https://github.com/BlindingDark/wordninja-rs-lua"
makedepends=('cargo' 'lua')
arch=('x86_64')
license=('MIT')
provides=(wordninja-rs-lua)
conflicts=(wordninja-rs-lua)
source=("git+https://github.com/BlindingDark/wordninja-rs-lua")
sha256sums=(SKIP)

pkgver() {
  cd $_pkgname
  git describe --long --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $_pkgname
  RUSTUP_TOOLCHAIN=stable cargo build --release --features lua54
}

package() {
  cd $_pkgname
  install -Dm755 target/release/libwordninja_rs_lua.so "$pkgdir/usr/lib/lua/5.4/wordninja.so"
}
