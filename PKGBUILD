# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>
pkgname=wifitui
pkgver=0.8.0
pkgrel=1
pkgdesc="Fast featureful friendly wifi terminal UI"
arch=("aarch64" "x86_64")
url="https://github.com/shazow/wifitui"
license=("MIT")
depends=("glibc")
makedepends=("go")
source=("$pkgname-$pkgver::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('4d2d8ea402c61837d94145c10dc5d64366dbfbc862747d49f993bb41803c3711')

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o $pkgname .
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
