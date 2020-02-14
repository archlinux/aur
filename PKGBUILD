_pkgname="tinc-boot"
pkgname="${_pkgname}-git"
pkgver=54.c55df72
pkgrel=1
pkgdesc="Bootstrap your Tinc node quickly and easy"
arch=('x86_64')
url="https://github.com/User/"
license=('MPL2')
makedepends=('go>=1.1')
depends=()
provides=("${_pkgname}")
conflicts=()
epoch=1
_gourl="github.com/reddec/tinc-boot"

pkgver() {
	cd "src/${_gourl}"
	printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	GOPATH="$srcdir" go get -fix -v -x "${_gourl}/cmd/..."
}

build() {
	:
}

check() {
	GOPATH="$GOPATH:$srcdir" go test -v -x "${_gourl}/cmd/..."
}

package() {
  mkdir -p "$pkgdir/usr/bin"
  install -p -m755 "$srcdir/bin/"* "$pkgdir/usr/bin"
}

sha256sums=()
