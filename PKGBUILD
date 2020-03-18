# $Id$

# Maintainer: Chris Fordham <chris [at] fordham-nagy [dot] [id] [dot] [au]> aka flaccid

pkgname=vndr
pkgver=0.1.1
pkgrel=1
pkgdesc='Vndr is simple vendoring tool, which is inspired by Docker vendor script.'
arch=('x86_64')
url="https://github.com/LK4D4/vndr"
license=('Apache License Version 2.0')
makedepends=('go')
provides=('vndr')
source=('vndr::git+https://github.com/LK4D4/vndr')
sha1sums=('SKIP')

prepare() {
  export GOPATH="$srcdir/go"

  mkdir -p "$srcdir/go/src/github.com/LK4D4"
}

build() {
  ln -sf "$srcdir/vndr" "$GOPATH/src/github.com/LK4D4/"
  pushd "$GOPATH/src/github.com/LK4D4/vndr" >/dev/null
    go build -v -o ./bin/vndr .
  popd >/dev/null
}

package() {
  install -Dm755 "$GOPATH/src/github.com/LK4D4/vndr/bin/vndr" "$pkgdir/usr/bin/vndr"
}

# vim:set ts=2 sw=2 et:
