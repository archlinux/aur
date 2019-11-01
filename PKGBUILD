# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=perfops-cli
pkgver=0.8.0
pkgrel=1
pkgdesc="A simple command line tool to interact with hundreds of servers around the world. Run benchmarks and debug your infrastructure without leaving your console."
arch=(x86_64)
url="https://perfops.net"
license=('APACHE')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/ProspectOne/$pkgname.git#tag=v$pkgver")
sha256sums=(SKIP)

build() {
	cd "$pkgname"
	GOPATH="$srcdir" PERFOPS_BUILD_PLATFORMS=linux bash hack/build-all.sh
}

prepare() { 
	mkdir -p "src/github.com/ProspectOne"
	ln -sf "$srcdir/$pkgname" "src/github.com/ProspectOne/$pkgname"
}

package() {
	cd "$pkgname"
	install -Dm755 "release/perfops-linux-amd64" "$pkgdir/usr/bin/perfops-cli"
}
