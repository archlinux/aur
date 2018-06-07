# Maintainer: Alexis "Horgix" Chotard <alexis.horgix.chotard@gmail.com>

pkgname=scalingo-cli
_pkgname=scalingo
pkgver=1.8.0
pkgrel=1
conflicts=('scalingo-cli-bin')
pkgdesc="Scalingo (https://scalingo.com/) Command Line Interface - compile from source"
arch=('any')
url="https://github.com/Scalingo/cli"
license=('BSD')
makedepends=('go' 'godep')
source=($pkgname-$pkgver.tar.gz::"https://github.com/Scalingo/cli/archive/$pkgver.tar.gz")
sha256sums=('570cdaccefd2bd06d7228701b3509d7ab3343ac28e940f163c22396f58ba9650')

prepare() {
    mkdir -p "$srcdir/go/src/github.com/Scalingo"
}

build() {
  cp $srcdir/cli-$pkgver/LICENSE .
  export GOPATH="$srcdir/go"
  mv "cli-$pkgver" "$srcdir/go/src/github.com/Scalingo/cli"

  cd "$srcdir/go/src/github.com/Scalingo/cli"
  godep get ./scalingo
  cd "$srcdir"
  go build github.com/Scalingo/cli/scalingo
}

package() {
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  # To be included in later version
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
