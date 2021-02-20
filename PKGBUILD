# Maintainer: wisp3rwind <17089248+wisp3rwind@users.noreply.github.com>

pkgname=rust-cli-book-git
pkgver=r287.a3d4bff
pkgrel=1
pkgdesc="Command line apps in Rust"
arch=('any')
url="https://rust-cli.github.io/book/index.html"
license=('MIT')
makedepends=('mdbook')
source=("${pkgname%-*}::git+https://github.com/rust-cli/book.git")
b2sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-*}"

  mdbook build
}

check() {
  cd "${pkgname%-*}"

  mdbook test
}

package() {
  cd "${pkgname%-*}"

  dest="$pkgdir/usr/share/doc/rust-cli-book/html"
  install -d "$dest"
  cp -a book/* "$dest"
}

# vim:set ts=2 sw=2 et:
