# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=perfops-cli
pkgver=0.8.18 # renovate: datasource=github-releases depName=ProspectOne/perfops-cli
pkgrel=1
pkgdesc="A simple command line tool to interact with hundreds of servers around the world. Run benchmarks and debug your infrastructure without leaving your console."
arch=(x86_64)
url="https://perfops.net"
license=('APACHE')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/ProspectOne/$pkgname.git#tag=v$pkgver")
sha256sums=('197380ab784474a25ae50a7cf604fddd7d25922be27df2d7f5aec07004595808')

build() {
	cd "$pkgname"
	GOPATH="$srcdir"
        PERFOPS_BUILD_PLATFORMS=linux
        go mod vendor
        go mod tidy
        CGO_ENABLED=0 go build -v
}        

package() {
	install -Dm755 "$srcdir/perfops-cli/perfops-cli" "$pkgdir/usr/bin/perfops-cli"
}
