# Maintainer: Caleb Bassi <calebjbassi@gmail.com>

pkgname=ytop
pkgver=0.1.0
pkgrel=1
pkgdesc="A TUI system monitor written in Rust"
arch=(x86_64)
url="https://github.com/cjbassi/ytop"
license=("MIT")
makedepends=("cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('7831dffb9452a74b6d514fa6e639670745c8679d58b27a159f521478e0ae47d4')

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=loop
build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  if command -v rustup > /dev/null 2>&1; then
    RUSTFLAGS="-C target-cpu=native" rustup run stable \
      cargo build --release
  elif rustc --version | grep -q nightly; then
    RUSTFLAGS="-C target-cpu=native" \
      cargo build --release
  else
    cargo build --release
  fi
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
