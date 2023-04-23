# Maintainer: Mark Collins <tera_1225 haat hotmail dot com>
pkgname=signaldctl
_basename=signald-go
pkgver=0.6.1
pkgrel=1
pkgdesc="cli interface to signald alternative signal client daemon"
arch=('x86_64' 'armv7h' 'aarch64') # The CI infrastructure builds for these so they are considered tested
url="https://gitlab.com/signald/${_basename}/-/blob/main/cmd/signaldctl/README.md"
license=('GPL')
depends=()
makedepends=('go')
source=("https://gitlab.com/signald/${_basename}/-/archive/v${pkgver}/${_basename}-v${pkgver}.tar.gz")
sha256sums=('f1d4206c2b4c3ecebe4305747d829cf4b0d7dec1d5bf1cb1844c423ab52bbcfa')

build() {
	cd "${_basename}-v$pkgver"
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
  cd "${_basename}-v$pkgver"
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
