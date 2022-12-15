# Maintainer: Federico Squartini <federico.squartini at gmail dot com>

pkgname=exercism
pkgver=3.1.0
pkgrel=1
pkgdesc="Command line tool for exercism.io"
arch=("i686" "x86_64")
url="https://github.com/exercism/cli"
license=("MIT")
depends=("glibc")
makedepends=("go-pie")
source=("https://github.com/exercism/cli/archive/v${pkgver}.tar.gz")
sha256sums=('34653a6a45d49daef10db05672c9b4e36c3c30e09d57c3c0f737034d071ae4f6')

prepare() {
  export GOPATH="$srcdir/.gopath"

  mkdir -p "$GOPATH/src/github.com/exercism"
  ln -sf "$srcdir/cli-$pkgver" "$GOPATH/src/github.com/exercism/cli"
}

build() {
  export GOPATH="$srcdir/.gopath"

  cd "$GOPATH/src/github.com/exercism/cli"
  go build -o out/exercism exercism/main.go
}

package(){
  cd $srcdir/cli-${pkgver}

  install -D out/exercism "$pkgdir/usr/bin/exercism"

  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D -m644 shell/exercism_completion.bash "$pkgdir/usr/share/$pkgname/completion/exercism_completion.bash"
  install -D -m644 shell/exercism_completion.zsh "$pkgdir/usr/share/$pkgname/completion/exercism_completion.zsh"
}
