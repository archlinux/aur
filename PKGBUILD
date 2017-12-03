# Maintainter Vincent Dahmen <support@phraseapp.com>

pkgname=phraseapp-client-git
pkgdesc="PhraseApp CLI tool"
pkgver=1.6.0
pkgrel=1
arch=('any')
makedepends=('git')
depends=('go')
url="https://github.com/phrase/phraseapp-client"
license=('MIT')
conflcits=('phraseapp-client')
_gourl=github.com/phrase/phraseapp-client

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

check() {
  GOPATH="$srcdir" go test -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"

  mkdir -p "$pkgdir/$GOPATH"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/$GOPATH"

  # Package license (if available)
  for f in LICENSE COPYING LICENSE.* COPYING.*; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
}

# vim:set ts=2 sw=2 et:
