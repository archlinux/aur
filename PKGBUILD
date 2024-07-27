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
makedepends=('cargo')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/MitMaro/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('0b1ba68a1ba1548f44209ce1228d17d6d5768d72ffa991909771df8e9d42d70d')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo build --release --locked
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  cargo test --release --locked
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -Dm755 "target/release/$_binname" "$pkgdir/usr/bin/interactive-rebase-tool"
  install -Dm644 "src/$_binname.1" "$pkgdir/usr/share/man/man1/interactive-rebase-tool.1"
}

