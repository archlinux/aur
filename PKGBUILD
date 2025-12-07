# Maintainer: tippfehlr <tippfehlr@tippfehlr.dev>

pkgname=shq
pkgver=0.2.0
pkgrel=1
pkgdesc='shell queue'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://codeberg.org/tippfehlr/shq"
license=('MIT')
makedepends=('go' 'git')
source=("git+$url#tag=v$pkgver")
sha512sums=('a94887d365ae8c171718a1ae8d397cb615fe2fc303fbd896ba910e2af73d2ef12ea5132d278f98e8a4669433c3f6696fa42a7f4d5a8245b682e8268a981f3eda')

prepare() {
	cd $pkgname
	export GOPATH="${srcdir}"
	go mod download -modcacherw
}

build() {
    cd $pkgname
	export GOPATH="${srcdir}"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o shq
}

package() {
    cd $pkgname
    install -Dm755 shq -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
