# Maintainer: éclairevoyant

pkgname=ascii-image-converter
pkgver=1.13.0
pkgrel=2
pkgdesc="Convert images into ASCII art and print them out to the console"
arch=('x86_64')
url="https://github.com/TheZoraiz/$pkgname"
license=('Apache')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e9774374d6d3e0504bba70e2499b5472a216c93c61a0cafd0265ae47e9c7c5e5')

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
