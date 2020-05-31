# Maintainer: hashworks <mail@hashworks.net>
pkgname=srrdb-terminal-client
pkgver=1.1.5
pkgrel=2
pkgdesc="A terminal client to access srrdb.com, written in Go."
arch=("x86_64")
url="https://github.com/hashworks/srrdb-Terminal-Client"
license=("GPL3")
changelog=CHANGELOG
makedepends=('go')
source=("${url}/archive/v${pkgver}.tar.gz")
sha256sums=("e1be74da97202cf3cb6737f56f84cec42158167940b20dfc5f1302d7399c761c")

prepare(){
	cd "srrdb-Terminal-Client-${pkgver}"
	mkdir -p build/
}

build() {
	cd "srrdb-Terminal-Client-${pkgver}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -o build .
}

check() {
	cd "srrdb-Terminal-Client-${pkgver}"
	go test .
}

package() {
	cd "srrdb-Terminal-Client-${pkgver}"
	install -Dm755 "build/srrdb-Terminal-Client-${pkgver}" "${pkgdir}/usr/bin/srrdb"
}
