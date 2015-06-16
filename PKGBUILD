# Maintainer: Jon Gjengset <jon@tsp.io>

pkgname=kebab
pkgver=r2.1.26d759e
pkgrel=1
pkgdesc="a backup tool that prioritizes confidentiality, integrity, and availability above all else."
arch=('x86_64' 'i686')
url="https://github.com/davidlazar/kebab/"
license=('GPL3')
depends=('go')
makedepends=('git')
options=('!strip' '!emptydirs')
_gourl="github.com/davidlazar/kebab"

pkgver() {
  cd "$srcdir/src/${_gourl}"
  printf "r%s.%s.%s" "$(git rev-list --count HEAD)" "${pkgrel}" "$(git rev-parse --short HEAD)"
}

build() {
  GOPATH="$srcdir" go install -v -x ${_gourl}/...
}

check() {
  GOPATH="$GOPATH:$srcdir" go test -v -x ${_gourl}/...
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
