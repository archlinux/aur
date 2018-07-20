# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>

pkgname=terminal-parrot
pkgver=1.1.0
pkgrel=1
conflicts=('terminal-parrot-git')
pkgdesc="Party parrot (http://cultofthepartyparrot.com) for your terminal"
arch=('any')
url="https://github.com/jmhobbs/terminal-parrot"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=($pkgname-$pkgver.tar.gz::"https://github.com/jmhobbs/terminal-parrot/archive/$pkgver.tar.gz")
sha256sums=('beba7a1fb643b72e3d2f23f5371936828653e60c1bb1339cf732026e15b8370d')

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
