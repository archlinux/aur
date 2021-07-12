# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=dbmate
pkgver=1.12.0
pkgrel=1
pkgdesc=" A lightweight, framework-agnostic database migration tool."
url="https://github.com/amacneil/dbmate"
arch=("x86_64")
license=("MIT")
makedepends=("go")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amacneil/dbmate/archive/v$pkgver.tar.gz")
sha512sums=('4ac2da3c32559492f042ce52127dbc753e3a5f73a644e952dcbcdcac14aef95f22541189c7f8daaa88c87e67b8a09498d75111339cee6ec308e65c1b2362198f')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw -ldflags=-linkmode=external"
	go build -o dbmate
}

check() {
	cd "${pkgname}-${pkgver}"
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 dbmate "$pkgdir/usr/bin/dbmate"
}
