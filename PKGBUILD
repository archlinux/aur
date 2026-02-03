# Maintainer: Keon Cachia <keonfarrugia@gmail.com>
pkgname=wallchemy
pkgver=1.0.6
pkgrel=2
pkgdesc='CLI tool for fetching wallpapers from wallhaven.cc'
arch=('x86_64' 'aarch64')
url=https://github.com/davenicholson-xyz/${pkgname}
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('0c2952dcd05e08eb2efbd19c7ba3e5b2a5a6d5845e3a5a0f6ae523eba58dbe0d')
conflicts=('wallchemy-bin')

build() {
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	cd ${pkgname}-${pkgver}
	go build
}
package() {
	cd ${pkgname}-${pkgver}
	install -Dm744 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
