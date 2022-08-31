# Maintainer: Mark Collins <tera_1225 haat hotmail dot com>
pkgname=signaldctl
_basename=signald-go
pkgver=0.5.2
pkgrel=1
pkgdesc="cli interface to signald alternative signal client daemon"
arch=('x86_64' 'armv7h' 'aarch') # The CI infrastructure builds for these so they are considered tested
url="https://gitlab.com/signald/${_basename}/-/blob/main/cmd/signaldctl/README.md"
license=('GPL')
depends=()
makedepends=('go')
source=("https://gitlab.com/signald/${_basename}/-/archive/v${pkgver}/${_basename}-v${pkgver}.tar.gz")
sha256sums=('366356a841b4887bc90397d953771017d5be8f11e213dda30b9778a5bb5912ab')

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
