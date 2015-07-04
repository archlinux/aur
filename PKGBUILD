# Maintainer: Jonhnny Weslley <jw@jonhnnyweslley.net>
pkgname=stats-tools
pkgver=0.0.1
pkgrel=1
pkgdesc="A set of command-line statistics tools"
arch=('i686' 'x86_64')
url="https://github.com/jweslley/$pkgname"
license=('MIT')
depends=('glibc')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/jweslley/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('c1549f30e942ea3674fa0d98cd5abdda')

build() {
  export GOPATH="$srcdir"

  mkdir -p "$srcdir/src"
  mv "$srcdir/$pkgname-$pkgver" "$srcdir/src/$pkgname"
  cd "$srcdir/src/$pkgname"

  go get ./...
  go install ./...
}

package() {
  cd "$srcdir/bin"

  for bin in `ls`; do
    install -Dm755 "$bin" "$pkgdir/usr/local/bin/$bin"
  done
  install -Dm644 "$srcdir/src/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
