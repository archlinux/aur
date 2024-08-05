# Maintainer: Anže Pintar <anze@anzepintar.com>

pkgname=easyindex-cli
pkgver=1.0.6
pkgrel=1
pkgdesc="Easyindex-cli makes super easy to use Google Index API and IndexNow API"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/usk81/easyindex-cli"
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.xz::https://github.com/usk81/easyindex-cli/archive/refs/tags/v$pkgver.tar.gz")
conflicts=("easyindex-cli-bin")
sha256sums=('d79a7974b4bbccf6f0bcf7c018bd7301403fe9c49de2b7b0d8bc6db3c7dc022f')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"
	go build -v -o easyindex-cli .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 easyindex-cli "$pkgdir/usr/bin/easyindex-cli"
}
