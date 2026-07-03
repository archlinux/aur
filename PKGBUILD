# Maintainer: Neuwj <neuwj@linuxmail.org>
pkgname=foldertree
_pkgname=ftr
pkgver=1.0.0
pkgrel=1
pkgdesc="A fast directory tree generator written in Rust"
arch=('x86_64')
url="https://github.com/Neuwj-00/Foldertree"
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'xclip')
makedepends=('cargo' 'git')
source=("${pkgname}-${pkgver}::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "${pkgname}-${pkgver}"

  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target

  cargo build --frozen --release --all-features
}

package() {
  cd "${pkgname}-${pkgver}"

  install -Dm755 "target/release/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
