# Maintainer: Tony Lambiris <tony@criticalstack.com>

pkgname=dive-git
pkgver=v0.2.0.r1.ge0af39c
_pkgname=dive
pkgrel=1
pkgdesc="A tool for exploring each layer in a docker image"
url="https://github.com/wagoodman/dive"
arch=('x86_64' 'i686')
license=('MIT')
makedepends=('go')
source=("${_pkgname}::git+https://github.com/wagoodman/dive.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"

	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	cd "${srcdir}"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go get -v -u github.com/wagoodman/dive
}

build() {
	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	GOROOT="/usr/lib/go" GOPATH="${srcdir}/go" PATH="$PATH:$GOPATH/bin" \
		go build github.com/wagoodman/dive
}

package() {
	cd "${srcdir}/go/src/github.com/wagoodman/dive"

	install -Dm755 "dive" "${pkgdir}/usr/bin/dive"
}
