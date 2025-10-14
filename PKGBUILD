# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=dgop
pkgver=0.1.7
pkgrel=1
pkgdesc='System monitoring CLI + REST API'
arch=(x86_64 aarch64 armv7h)
url="https://github.com/AvengeMedia/$pkgname"
license=(MIT)
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('da0132f302b7854511d618753e881ccdb6e342a01a57ad007046841720c532ee')

prepare() {
	cd "$_archive"
	export CGO_CPPFLAGS="$CPPFLAGS"
	export CGO_CFLAGS="$CFLAGS"
	export CGO_CXXFLAGS="$CXXFLAGS"
	export CGO_LDFLAGS="$LDFLAGS"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
	go build -o "$pkgname" ./cmd/cli
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
