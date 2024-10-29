# Maintainer: gilcu3
# Previous Maintainer: Y7n05h < echo WTduMDVoQHk3bjA1aC5kZXY= | base64 -d >
pkgname=ecapture
pkgver=0.8.8
pkgrel=1
pkgdesc="capture SSL/TLS text content without CA cert using eBPF"
arch=("x86_64" "aarch64")
url="https://github.com/gojue/ecapture"
license=("Apache")
depends=("glibc")
makedepends=("clang" "go" "bpf" "git")
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('6a1075ec402e4d88fca07023f5970203daf97414f9865b149efc83f9297d3138')
prepare() {
	cd "$pkgname"
	# sed -i 's/-w -s/-compressdwarf=false -linkmode external -extldflags \\"\$\{LDFLAGS\}\\"/g' Makefile
}
build() {
	cd "$pkgname"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}"
    export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
	make
}
package() {
	cd "$pkgname"
	install -Dm755 "bin/$pkgname" -t "$pkgdir/usr/bin"
}
