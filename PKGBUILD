# Maintainer: gilcu3
# Previous Maintainer: Y7n05h < echo WTduMDVoQHk3bjA1aC5kZXY= | base64 -d >
# Contributor: Y7n05h
pkgname=ecapture
pkgver=2.3.0
pkgrel=1
pkgdesc="capture SSL/TLS text content without CA cert using eBPF"
arch=("x86_64" "aarch64")
url="https://github.com/gojue/ecapture"
license=("Apache")
depends=("glibc")
makedepends=("clang" "go" "bpf" "git" "linux-headers" "libelf" "llvm" "pkgconf")
source=("${pkgname}::git+${url}#tag=v${pkgver}")
sha256sums=('a0f025c9dd2972709f3e6359deccc6b7274127a8aad5a2e238105c77265b9073')
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
