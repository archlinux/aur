# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>

pkgname=terminal-parrot-git
pkgver=1.1.0
pkgrel=1
conflicts=('terminal-parrot')
pkgdesc="Party parrot (http://cultofthepartyparrot.com) for your terminal"
arch=('any')
url="https://github.com/jmhobbs/terminal-parrot"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("git://github.com/jmhobbs/terminal-parrot.git")
sha256sums=('SKIP')

prepare() {
    mkdir -p go
    echo $srcdir
    export GOPATH="$srcdir/go"
    go get github.com/nsf/termbox-go
}

build() {
  export GOPATH="$srcdir/go"
  cd "terminal-parrot"

  go build
}

package() {
  cd "terminal-parrot"

  install -Dm755 "terminal-parrot" "$pkgdir/usr/bin/terminal-parrot"
  # To be included in later version
  #install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
