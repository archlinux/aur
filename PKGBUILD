# Maintainer: éclairevoyant

pkgname=ascii-image-converter
pkgver=1.13.1
pkgrel=1
pkgdesc="Convert images into ASCII art and print them out to the console"
arch=('x86_64')
url="https://github.com/TheZoraiz/$pkgname"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3f4d6c62ee3f74c7c165c64209f9de8add01e6d3149174fe35f419cfaafc316a')

build() {
	cd $pkgname-$pkgver
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -v -o $pkgname
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 $pkgname -t "$pkgdir/usr/bin/"
}
