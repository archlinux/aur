# Maintainer: Slavi Pantaleev <slavi at devture dot com>

pkgname=agru
pkgver=0.1.19
pkgrel=0
pkgdesc="Ansible-Galaxy Requirements Updater - a fast ansible-galaxy replacement"
arch=('any')
url="https://github.com/etkecc/agru"
license=('GPL3')
depends=()
makedepends=('git' 'go')
source=('vcs-repository::git+https://github.com/etkecc/agru#tag=v'$pkgver)
md5sums=('SKIP')

build() {
	export GOPATH="$srcdir/gopath"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

	cd "$srcdir/vcs-repository"

	go build -v -o agru ./cmd/agru/main.go
}

package() {
	install -Dm 755 $srcdir/vcs-repository/agru $pkgdir/usr/bin/agru
}
