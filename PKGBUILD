# Maintainer: sQVe <oskargrunning@gmail.com>
pkgname=markdown-oxide-git
_pkgname=markdown-oxide
pkgver=r255.3ea0b15
pkgrel=1
pkgdesc="A markdown language server with Obsidian syntax support."
arch=('x86_64')
url="https://github.com/Feel-ix-343/markdown-oxide"
license=('CC0')
makedepends=('git' 'rustup')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Feel-ix-343/markdown-oxide.git")
sha256sums=('SKIP') # 'SKIP' since content is fetched from git.

pkgver() {
  cd "${_pkgname}"

  # Use git to get the version.
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rustup toolchain install nightly
}

build() {
  cd "${_pkgname}"

  rustup run nightly cargo build --release --locked
}

package() {
  cd "${_pkgname}"

  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
