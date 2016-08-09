# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=go-notify-git
pkgver=20160809
pkgrel=1
pkgdesc="Go bindings for the C library libnotify"
arch=('x86_64' 'i686')
url="https://github.com/mqu/go-notify"
license=('MIT')
depends=('go-gtk' 'libnotify')
makedepends=('git')
conflicts=('go-notify')
provides=('go-notify')
options=('!strip' '!emptydirs')
_gourl=github.com/mqu/go-notify

build() {
  GOPATH="$srcdir" go get -fix -v -x ${_gourl}
}

package() {
  mkdir -p "$pkgdir/usr/lib/go"
  cp -Rv --preserve=timestamps "$srcdir/"{src,pkg} "$pkgdir/usr/lib/go"
  rm -r "$pkgdir/usr/lib/go/src/$_gourl/.git"
  install -Dm644 "$srcdir/src/$_gourl/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find "$pkgdir/usr/lib/go" \
        -name ".*" -prune -exec rm -r '{}' \;
}
