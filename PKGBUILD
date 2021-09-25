# Maintainer: seth <getchoo at tuta dot io>

pkgname=joshuto
_pkgname=joshuto
pkgver=0.9.1
pkgrel=1
pkgdesc="ranger-like terminal file manager written in Rust"
arch=("any")
url="https://github.com/kamiyaa/joshuto"
license=("LGPL3")
depends=("file" "xdg-utils")
makedepends=("git" "cargo")
provides=(${_pkgname})
conflicts=(${_pkgname})
source=("https://github.com/kamiyaa/joshuto/archive/refs/tags/$pkgver.tar.gz")
md5sums=('a80cb1d2ff252f861f80b438f582b556')

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
