# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=go-gtk-git
pkgver=20160809
pkgrel=1
pkgdesc="Go bindings for GTK2"
arch=('x86_64' 'i686')
url="https://github.com/mqu/go-notify"
license=('BSD' 'LGPL')
depends=('go' 'gtksourceview2')
makedepends=('git')
conflicts=('go-gtk')
provides=('go-gtk')
options=('!strip' '!emptydirs')
_gourl=github.com/mattn/go-gtk

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}/gtksourceview
}

package() {
  mkdir -p "$pkgdir/usr/lib/go"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/usr/lib/go"
  rm -r "$pkgdir/usr/lib/go/src/$_gourl/.git"
  install -Dm644 "$srcdir/src/$_gourl/README.md" \
    "$pkgdir/usr/share/licenses/$pkgname/README.md"

  find "$pkgdir/usr/lib/go" \
        -name ".*" -prune -exec rm -r '{}' \;
}
