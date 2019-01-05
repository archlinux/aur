# Maintainer: zargbell <zargbell@yandex.ru>

pkgname=pixiecore
pkgver=2018.283
pkgrel=1
epoch=
pkgdesc="An all-in-one tool for easy netbooting"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/google/netboot/tree/master/pixiecore"
license=('GPL2')
groups=()
depends=()
makedepends=('go' 'git' 'curl' 'jq')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
#validpgpkeys=()


prepare() {
	export GOPATH="$srcdir/go"
	export GOBIN="$GOPATH/bin"
	mkdir -p $GOPATH
	mkdir -p $GOBIN
	go env
}

pkgver(){
	# date last comment
	curl -s 'https://api.github.com/repos/google/netboot/commits?per_page=1' | jq -c -r '.[].commit.committer.date | fromdate | strftime("%Y.%j")'
}

build() {
	export GOPATH="$srcdir/go"
	export GOBIN="$GOPATH/bin"
	go get -v go.universe.tf/netboot/cmd/pixiecore
}


package() {
	export GOPATH="$srcdir/go"
	export GOBIN="$GOPATH/bin"
	install -Dm755 "$GOBIN/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
