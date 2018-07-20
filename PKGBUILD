# Maintainer: Lumi Schallenberg <florian.schallenberg@googlemail.com>

pkgname=bingopher-git
pkgver() {
	date +%Y%m%d%H%M
	}
pkgver=201807201702
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

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,bin} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
