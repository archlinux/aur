# Maintainer: OGrigorios <aur@giotas.io>

pkgname=lazysql
pkgver=0.4.8
pkgrel=1
pkgdesc="A cross-platform TUI database management tool written in Go"
arch=('x86_64' 'i386' 'aarch64')
makedepends=('go')
url="https://github.com/jorgerojas26/$pkgname"
license=('MIT')
source=("https://github.com/jorgerojas26/lazysql/archive/refs/tags/v$pkgver.tar.gz")
# prepare() {
# 	cd "$pkgname-$pkgver"
# 	mkdir -p build/
# }
# prepare() {
# 	mkdir -p "$srcdir/$pkgname-$pkgver"
# 	tar -xzf "$srcdir/$pkgname-$pkgver-${CARCH}.tar.gz" -C "$srcdir/$pkgname-$pkgver" --strip-components=1
# 	cd "$srcdir/$pkgname-$pkgver"
# 	mkdir -p build/
# }
prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build
}

check() {
	cd "$pkgname-$pkgver"
	go test ./...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/"$pkgname" "$pkgdir"/usr/bin/"$pkgname"
}
sha256sums=('bc6f00759376a30cbeb28af3200a0df2ab3df07f41717be2cf08122827e1671f')
