# Maintainer: Lumi Schallenberg <florian.schallenberg@googlemail.com>

pkgname=bingopher-git
pkgver() {
	git rev-parse HEAD
}
pkgver=5d4a784dd6886a84173b9ed3eaf5db86b0cb1514
pkgrel=1
pkgdesc="Converts binary files to Go variables"
arch=('x86_64' 'i686')
url="https://github.com/lumi-sch/bingopher"
license=('MIT')
depends=('go')
makedepends=('go')
options=('!strip' '!emptydirs')
_gourl=github.com/lumi-sch/bingopher

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

