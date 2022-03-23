# Maintainer: Mark Collins <tera_1225 haat hotmail dot com>
pkgname=signaldctl
_basename=signald-go
pkgver=0.4.0
pkgrel=1
pkgdesc="cli interface to signald alternative signal client daemon"
arch=('x86_64' 'armv7h' 'aarch') # The CI infrastructure builds for these so they are considered tested
url="https://gitlab.com/signald/${_basename}/-/blob/main/cmd/signaldctl/README.md"
license=('GPL')
depends=()
makedepends=('go')
source=("https://gitlab.com/signald/${_basename}/-/archive/${pkgver}/${_basename}-${pkgver}.tar.gz")
sha256sums=('4e8beebdd6dc84a0724a1b121abea29cabf64a0889d9e3e79424a96964786372')

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
