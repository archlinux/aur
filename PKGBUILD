# Maintainer: Charlie Li <vishwin AT vishwin POINT info>

pkgname=cockroachdb
_basever=1.0.2
pkgver=${_basever}
pkgrel=1
epoch=1
pkgdesc="A scalable, survivable, strongly-consistent SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs>=6.0')
makedepends=('gcc>=6.0' 'git>=1.8' 'go' 'make' 'cmake' 'xz')
options=('!buildflags')
source=("git+https://github.com/cockroachdb/cockroach.git#tag=v${_basever}")
sha256sums=('SKIP')

prepare() {
	export GOPATH=$(pwd)/go
	mkdir -p ${GOPATH}/src/github.com/cockroachdb
	cp -r cockroach ${GOPATH}/src/github.com/cockroachdb
}

build() {
	export GOPATH=$(pwd)/go
	cd ${GOPATH}/src/github.com/cockroachdb/cockroach
	make build
}

package() {
	export GOPATH=$(pwd)/go
	cd ${GOPATH}/src/github.com/cockroachdb/cockroach
	install -Dm755 cockroach ${pkgdir}/usr/bin/cockroach
}
