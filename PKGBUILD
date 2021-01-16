# Maintainer: Seth Flynn <g3tchoo@protonmail.com>

pkgname=joshuto
_pkgname=joshuto
pkgver=0.8.5
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
arch=("any")
url="https://github.com/kamiyaa/joshuto"
license=("LGPL3")
depends=("file" "xdg-utils")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/kamiyaa/joshuto/archive/0.8.5.tar.gz")
md5sums=("451bce32cde13b959ae545635c8c8f88")

# https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=loop
build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
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
  install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
