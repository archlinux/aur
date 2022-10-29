# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=dwarf2json-git
pkgver=r24.c306d11
pkgrel=1
pkgdesc="Processes files containing symbol and type information to generate Volatility3 Intermediate Symbol File (ISF) JSON output"
arch=('x86_64')
url="https://github.com/volatilityfoundation/dwarf2json"
license=('custom:volatility')
makedepends=('go')
source=('git+https://github.com/volatilityfoundation/dwarf2json')
sha256sums=('SKIP')

pkgver() {
	cd dwarf2json
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd dwarf2json
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build
}

package() {
	cd dwarf2json
	install -Dm755 dwarf2json "$pkgdir/usr/bin/dwarf2json"
	install -Dm755 LICENSE.txt "$pkgdir/usr/share/licenses/volatility"
}
