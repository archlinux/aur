# Maintainer: Mark Collins <tera_1225 haat hotmail dot com>
pkgname=signaldctl
_basename=signald-go
pkgver=0.2.0
pkgrel=1
pkgdesc="cli interface to signald alternative signal client daemon"
arch=('x86' 'armv7h' 'aarch') # The CI infrastructure builds for these so they are considered tested
url="https://gitlab.com/signald/${_basename}/-/blob/main/cmd/signaldctl/README.md"
license=('GPL')
depends=()
makedepends=('go')
source=("https://gitlab.com/signald/${_basename}/-/archive/${pkgver}/${_basename}-${pkgver}.tar.gz")
sha256sums=('58dd1c0d7d071702205df78cd1fb68448792ab7b3218be4e6774bd8e8f4dd442')

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
