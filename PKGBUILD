# Maintainer: Agastya <me@hanabi.in>

pkgname=manuscript-git
_og_pkgname=manuscript

pkgver=r25.0a5b0d0
pkgrel=1
pkgdesc="A fast, native GNOME Markdown reader and editor written in Rust"

arch=('x86_64')
url="https://gitlab.com/ilshat-apps/manuscript"
license=('GPL-3.0-or-later')
depends=()
makedepends=('git' 'rust')
provides=("$_og_pkgname")
conflicts=("$_og_pkgname")

source=('git+https://gitlab.com/ilshat-apps/manuscript')

sha256sums=('SKIP')
options=('!strip' '!lto')

pkgver() {
  cd "$srcdir/$_og_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_og_pkgname"
  cargo build --release --locked
}

check() {
  cd "$srcdir/$_og_pkgname"
  cargo test --release --locked
}

package() {
  cd "$srcdir/$_og_pkgname"
  install -Dm755 "target/release/$_og_pkgname" "$pkgdir/usr/bin/$_og_pkgname"
}
