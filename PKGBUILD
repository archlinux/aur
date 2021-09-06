# Maintainer: Mark Collins <tera_1225 haat hotmail dot com>
pkgname=signaldctl
_basename=signald-go
pkgver=0.3.0
pkgrel=1
pkgdesc="cli interface to signald alternative signal client daemon"
arch=('x86' 'armv7h' 'aarch') # The CI infrastructure builds for these so they are considered tested
url="https://gitlab.com/signald/${_basename}/-/blob/main/cmd/signaldctl/README.md"
license=('GPL')
depends=()
makedepends=('go')
source=("https://gitlab.com/signald/${_basename}/-/archive/${pkgver}/${_basename}-${pkgver}.tar.gz")
sha256sums=('ed1f9e47666090dd5c694e6210b02350d024343036530e10c6689156aadbbd77')

build() {
	cd "${_basename}-$pkgver"
	go build \
	    -trimpath \
	    -buildmode=pie \
	    -mod=readonly \
	    -modcacherw \
	    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
	    -o "$pkgname" \
	    ./cmd/signaldctl
}

package() {
  cd "${_basename}-$pkgver"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
