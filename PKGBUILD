# Maintainer: Lumi Schallenberg <florian.schallenberg@googlemail.com>

pkgname=searchfile-git
pkgver() {
	git rev-list HEAD --count
}
pkgver=1
pkgrel=1
pkgdesc="The easiest way to find a file within seconds, with regex."
arch=('x86_64' 'i686')
url="https://github.com/lumi-sch/searchfile"
license=('MIT')
depends=('go')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl=github.com/lumi-sch/searchfile

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"


  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}
