# Maintainer: João Figueiredo <islandc0der@chaotic.cx>

pkgname=fishnet
pkgver=2.6.8
pkgrel=1
pkgdesc='Distributed Stockfish analysis for lichess.org'
arch=($CARCH)
url='https://github.com/lichess-org/fishnet'
license=(GPL)
makedepends=(git rust)
source=("git+$url#tag=v$pkgver"
        "git+https://github.com/official-stockfish/Stockfish"
        "git+https://github.com/ianfab/Fairy-Stockfish")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare(){
  cd $pkgname
  git submodule init
  git config submodule.Stockfish.url "$srcdir/Stockfish"
  git config submodule.Fairy-Stockfish.url "$srcdir/Fairy-Stockfish"
  git submodule update
}

build() {
  cd $pkgname
  cargo build --release -vv --
}

package() {
  install -Dm755 $pkgname/target/release/fishnet -t "$pkgdir/usr/bin/"
}
