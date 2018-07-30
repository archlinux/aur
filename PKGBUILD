# Maintainer: zargbell <zargbell@yandex.ru>
pkgname=pixiecore-git
pkgver=r306.870d490
pkgrel=1
pkgdesc="An all-in-one tool for easy netbooting"
arch=("x86_64" "armv7h")
url="https://github.com/google/netboot"
license=("GPL2")
depends=("glibc")
makedepends=("git" "go")
optdepends=()
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
options=()


prepare() {
	export GOPATH="$srcdir/go"
	mkdir -p $GOPATH

	export GOBIN="$GOPATH/bin"
	mkdir -p $GOBIN

	go env

	go get -d -v go.universe.tf/netboot/cmd/pixiecore
}

pkgver(){
	cd "${GOPATH}/src/go.universe.tf/netboot/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	go install -v go.universe.tf/netboot/cmd/pixiecore
}

package() {
	install -Dm755 "$GOBIN/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}