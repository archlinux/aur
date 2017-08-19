# Maintainer: orumin <dev at orum.in>

pkgname=diagram
pkgver=20170819
pkgrel=1
pkgdesc="CLI app to convert ascii arts into hand drawn diagrams written in go."
arch=('x86_64' 'i686')
url="https://github.com/esimov/diagram"
license=('MIT')
makedepends=('go' 'git')
options=('!strip' '!emptydirs')
_gourl=github.com/esimov/diagram

build() {
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

check() {
  GOPATH="/usr/lib/go:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/usr/lib/go"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/usr/lib/go"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
