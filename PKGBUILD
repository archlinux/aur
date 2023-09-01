# Maintainer Edouard Jubert <edouard.jubert@gmail.com>
pkgname=gophrland
pkgver=0.0.9
pkgrel=1
pkgdesc='Gophrland is a set of tools to manage windows on Hyprland.'
arch=('x86_64')
url="https://github.com/edjubert/$pkgname"
license=('GPL')
makedepends=('go')
source=("https://codeload.github.com/edjubert/$pkgname/tar.gz/refs/tags/v$pkgver")
sha256sums=('5f8023c1c0d4af6e0659cb480872a63970f32b7bb2a6d32c94ef6fa46da09949')

prepare() {
	cd "$pkgname-$pkgver"
	mkdir -p build/
}

build() {
	cd "$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o build ./cmd/...
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
}
