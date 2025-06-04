# Maintainer: elbachir-one <bachiralfa@gmail.com>
pkgname=typtea
pkgver=0.1.2
pkgrel=1
pkgdesc="Minimal terminal-based typing speed test"
arch=('x86_64')
url="https://github.com/ashish0kumar/typtea"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.22')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ashish0kumar/typtea/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('31618e10bc4eb01cb33cda8535d395b0c7290c4c48ebc5795a38a468f028572c')

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
	go build -v -o typtea
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 typtea "$pkgdir/usr/bin/typtea"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
