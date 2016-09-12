# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>

pkgname=terminal-parrot
pkgver=1.0.1
pkgrel=1
conflicts=('terminal-parrot-git')
pkgdesc="Party parrot (http://cultofthepartyparrot.com) for your terminal"
arch=('any')
url="https://github.com/jmhobbs/terminal-parrot"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jmhobbs/terminal-parrot/archive/$pkgver.tar.gz")
sha256sums=('11377c31e14d21f40a6d307dd14356642e88113a2a540c7d1160baca9dd07f56')

prepare() {
    mkdir -p go
    echo $srcdir
    export GOPATH="$srcdir/go"
    go get github.com/nsf/termbox-go
}

build() {
  export GOPATH="$srcdir/go"
  cd "$pkgname-$pkgver"

  go build
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 "$pkgname-$pkgver" "$pkgdir/usr/bin/$pkgname"
  # To be included in later version
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
