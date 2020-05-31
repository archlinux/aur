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
sha256sums=("957a4891937123f8b88d8155d2c55ce8e8a7428df11afa72b91c67159d8f2f42")

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
	go build -ldflags '-X main.VERSION='"${pkgver}"' -X main.BUILD_DATE='"$(date +"%Y-%m-%d_%H:%M:%S")" -o build .
}

check() {
	cd "srrdb-Terminal-Client-${pkgver}"
	go test .
}

package() {
	cd "srrdb-Terminal-Client-${pkgver}"
	install -Dm755 "build/srrdb-Terminal-Client" "${pkgdir}/usr/bin/srrdb"
}
