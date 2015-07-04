# Maintainer: Jonhnny Weslley <jw@jonhnnyweslley.net>
pkgname=procker
pkgver=0.1.1
pkgrel=2
pkgdesc="Process management tool for Procfile-based applications"
arch=('i686' 'x86_64')
url="https://github.com/jweslley/$pkgname"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("https://github.com/jweslley/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('ba60ee6e5cd784ea131928db402b366f')

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
    install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
  done
  install -Dm644 "$srcdir/src/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
