# Maintainer: Gabriel Guldner <gabriel at guldner dot eu>

pkgname=git-interactive-rebase-tool
pkgver=0.7.0
pkgrel=1
pkgdesc='Native cross platform full feature terminal based sequence editor for git interactive rebase. Written in Rust using ncurses.'
arch=('x86_64')
url='https://gitrebasetool.mitmaro.ca/'
license=('ISC')
depends=('git')
makedepends=('rust' 'cargo')
provides=('git-interactive-rebase-tool')
conflicts=('git-interactive-rebase-tool')
sha256sums=('SKIP')
source=('git+https://github.com/MitMaro/git-interactive-rebase-tool.git')

prepare() {
  cd $pkgname
  git checkout tags/$pkgver
  git clean -dfx
}
build() {
  cd $pkgname
  cargo build --release
}

package() {
  cd $pkgname
  mkdir -p $pkgdir/usr/bin
  mkdir -p $pkgdir/usr/share/man/man1
  mkdir -p $pkgdir/usr/share/licenses/$pkgname
  install -m755 target/release/interactive-rebase-tool $pkgdir/usr/bin/interactive-rebase-tool
  install -m644 src/interactive-rebase-tool.1 $pkgdir/usr/share/man/man1/interactive-rebase-tool.1
  install -m644 LICENSE $pkgdir/usr/share/licenses/$pkgname
  gzip $pkgdir/usr/share/man/man1/interactive-rebase-tool.1
}

