# Maintainer: Charlie Li <vishwin AT vishwin POINT info>

pkgname=cockroachdb
pkgver=20170413
pkgrel=1
pkgdesc="An open source, survivable, strongly consistent, scale-out SQL database"
arch=('x86_64')
url="https://www.cockroachlabs.com/"
license=('Apache')
depends=('gcc-libs>=6.0')
makedepends=('gcc>=6.0' 'git>=1.8' 'go')
source=("${pkgname}::git+https://github.com/cockroachdb/cockroach.git#tag=beta-${pkgver}")
sha256sums=('SKIP')

prepare() {
	export GOPATH=$(pwd)/go
	mkdir -p ${GOPATH}/src/github.com/cockroachdb
	cp -r ${pkgname} ${GOPATH}/src/github.com/cockroachdb/cockroach
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
