# Maintainer: OGrigorios <aur@giotas.io>

pkgname=lazysql
pkgver=0.3.2
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
sha256sums=('56ad352ae537c8836a2b4a236d36e23c06395d357335e4e4b225147a4773f3f0')
