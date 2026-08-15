# Maintainer: elbachir-one <bachiralfa@gmail.com>
pkgname=urusai
pkgver=1.1.1
pkgrel=1
pkgdesc="Go implementation of noisy HTTP/DNS traffic generator"
arch=('x86_64')
url="https://github.com/calpa/urusai"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/calpa/urusai/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e39ef0bcee462e0aaa823998ff3bbb635e870b74dae408499222fb4f0dee34a')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw -buildvcs=false"
	go build -v -o urusai
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 urusai "$pkgdir/usr/bin/urusai"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
