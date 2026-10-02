# shellcheck disable=SC2034,SC2154,SC2164
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=tdash
pkgver=0.5.5
pkgrel=1
pkgdesc="A terminal dashboard with stats from Google Analytics, GitHub, Travis CI, and Jenkins"
arch=('x86_64' 'aarch64')
url="https://github.com/jessfraz/tdash"
license=('MIT')
depends=('glibc')
makedepends=('go>=1.11')
options=('!lto')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('342c869888255cb7000d17667435b9f950a7be87c8840515ec3d594d2cb44e09')

build() {
	cd "tdash-$pkgver"
	export CGO_ENABLED=0
	export GOFLAGS="-buildmode=pie -trimpath -mod=vendor -modcacherw"
	go build -ldflags "-s -w" -o "$srcdir/$pkgname-build" .
}

package() {
	cd "tdash-$pkgver"
	install -Dm755 "$srcdir/$pkgname-build" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
