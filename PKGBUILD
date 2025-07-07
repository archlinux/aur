# Maintainer: Per Osbeck <per@osbeck.com>
pkgname=perfops-cli
pkgver=0.8.6 # renovate: datasource=github-releases depName=ProspectOne/perfops-cli
pkgrel=1
pkgdesc="A simple command line tool to interact with hundreds of servers around the world. Run benchmarks and debug your infrastructure without leaving your console."
arch=(x86_64)
url="https://perfops.net"
license=('APACHE')
makedepends=('git' 'go')
source=("$pkgname::git+https://github.com/ProspectOne/$pkgname.git#tag=v$pkgver")
sha256sums=('35f42a9fef4b0c45990ca411fa4181e9ceee19959d7b01d1e8600a16802fb892')

build() {
	cd "$pkgname"
	GOPATH="$srcdir"
        PERFOPS_BUILD_PLATFORMS=linux
        go mod vendor
        go mod tidy
        go build .
        #go get -u github.com/ProspectOne/perfops-cli
}

package() {
	install -Dm755 "$srcdir/perfops-cli/perfops-cli" "$pkgdir/usr/bin/perfops-cli"
}
