# Maintainer: Fredrik Magnusson <fredrikmagnusson3@gmail.com>

# Contributor: Martin Kröning <m.kroening@hotmail.de>
# Contributor: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=git-interactive-rebase-tool
_binname=interactive-rebase-tool
pkgver=2.4.1
pkgrel=1
pkgdesc='Native cross platform full feature terminal based sequence editor for git interactive rebase. Written in Rust using ncurses.'
arch=('x86_64' 'aarch64')
url='https://gitrebasetool.mitmaro.ca/'
license=('GPL3')
depends=('libgit2')
makedepends=('git' 'cargo')
install=$pkgname.install
source=("git+https://github.com/MitMaro/$pkgname#tag=$pkgver")
sha256sums=('28bc3a528c7b70ad3c436d86a42acd56e2102e09549af395fae27cf36e984769')

build() {
  cd "$pkgname"

  cargo build --release --locked
}

check() {
  cd "$pkgname"

  cargo test --release --locked
}

package() {
  cd "$pkgname"

  install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/interactive-rebase-tool"
  install -Dm644 "src/$_binname.1" "$pkgdir/usr/share/man/man1/interactive-rebase-tool.1"
}

