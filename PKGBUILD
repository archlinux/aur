# Maintainer: Alexander Rødseth <rodseth@gmail.com>

pkgname=godit
pkgver=20130106
pkgrel=1
pkgdesc='Emacs-like editor written in Go'
arch=('x86_64' 'i686')
url='https://github.com/nsf/godit'
license=('MIT')
makedepends=('go' 'go-check' 'go-termbox>=1-3')
options=('!strip' '!emptydirs')
_gourl=github.com/nsf/godit

build() {
  cd "$srcdir"
  GOPATH="$srcdir" go get -v -x ${_gourl}
}

check() {
  source /etc/profile.d/go.sh
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}
}

package() {
  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done
  install -Dm755 "$srcdir/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

# vim:set ts=2 sw=2 et:
