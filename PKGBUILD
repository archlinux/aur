# Maintainer: Denbeigh Stevens <denbeigh at denbeighstevens dot com>
# Contributor: Denbeigh Stevens

GITHUB_URL='github.com/denbeigh2000/goi3bar'

pkgver() {

  GOPATH="${srcdir:-$(mktemp -d)}"
  go get -u -v $GITHUB_URL
  pushd "$GOPATH/src/$GITHUB_URL" >/dev/null
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  popd >/dev/null
}

pkgname='goi3bar-git'
pkgrel=1
pkgver="$(pkgver)"
pkgdesc='A configurable, extensivle replacement for i3status written in Go'
url="https://$GITHUB_URL"
arch=('x86_64' 'i686')
license=('GPL2')
conflicts=('goi3bar')
provides=('goi3bar')
depends=()
makedepends=('git' 'go>=1.5.0')
optdepends=('wireless_tools: WLAN plugin support')
_gourl="$GITHUB_URL"

build() {
  GOPATH="$srcdir" go get -u -v ${_gourl}/...
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/goi3bar" "$pkgdir/usr/bin"

  install -Dm644 "$srcdir/src/$_gourl/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
