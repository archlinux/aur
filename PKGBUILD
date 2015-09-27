pkgname=batterystats-git
pkgver=r4.53f9ab9
pkgrel=1
epoch=
pkgdesc="A tool to collect battery stats"
arch=('i686' 'x86_64')
url="https://github.com/solarnz/batterystats"
license=('MIT')
groups=()
depends=('')
makedepends=('git' 'go')
optdepends=()
checkdepends=()
_gourl=github.com/solarnz/batterystats/...

pkgver() {
  cd "$srcdir/src/github.com/solarnz/batterystats"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/"
  GOPATH="$srcdir" go get -v -x ${_gourl}/...
}

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "bin/"* "$pkgdir/usr/bin"
  cd "$srcdir/src/github.com/solarnz/batterystats"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 batterystats.service "$pkgdir/usr/lib/systemd/system/batterystats.service"
  install -Dm644 batterystats-suspend.service "$pkgdir/usr/lib/systemd/system/batterystats-suspend.service"
}

# vim:set ts=2 sw=2 et:
