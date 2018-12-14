# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=aminal-git
pkgver=r358.bf90bfb
_pkgname=aminal
pkgrel=1
pkgdesc="Golang terminal emulator from scratch"
url="https://github.com/liamg/aminal"
arch=('x86_64' 'i686')
license=('GPL')
makedepends=('go')
source=("${_pkgname}::git+https://github.com/liamg/aminal.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go get -v -u github.com/liamg/aminal
}

build() {
	cd "${srcdir}/go/src/github.com/liamg/aminal"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go build github.com/liamg/aminal
}

package() {
	cd "${srcdir}/go/src/github.com/liamg/aminal"

	install -Dm755 "aminal" "${pkgdir}/usr/bin/aminal"
}
