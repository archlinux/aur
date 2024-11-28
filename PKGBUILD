# Maintainer: Richard Holt <meowxiik@gmail.com>
pkgname=boring
pkgver=0.8.0
pkgrel=1
pkgdesc="The \`boring\` SSH tunnel manager"
arch=('x86_64')
url="https://github.com/alebeck/boring"
license=('MIT')
depends=('go')

source=("$pkgname::git+$url.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  export GOPATH="$srcdir/go"
  mkdir -p "$GOPATH"
  go build -o ./bin/boring ./cmd/boring

  # go leaves a read-only directory which breaks yay. Remove it
  go clean -modcache
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "./bin/boring" "$pkgdir/usr/bin/boring"
}
