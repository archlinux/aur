# Maintainer: Isaac van Bakel <ivb@vanbakel.io>
pkgname=rnix-lsp-git
pkgver=0.1.0.r15.23a0743
pkgrel=1
pkgdesc="A language server for Nix"
arch=('x86_64')
url="https://github.com/nix-community/rnix-lsp"
license=('MIT')
groups=()
depends=()
makedepends=('git')
makedepends=('cargo')
provides=("${pkgname%-git}")
conflicts=()
replaces=()
backup=()
options=()
install=
source=("git+${url}.git#branch=master")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"

# Git, tags available, trimming leading 'v' from tag
  printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  cargo build --release --locked --target-dir=target
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm 755 "target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
}
