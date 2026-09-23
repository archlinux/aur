# Maintainer: Agil Mammadov <mammadovagil@proton.me>
pkgname=plombir
pkgver=1.0.0
pkgrel=1
pkgdesc='A ridiculously fast static site generator for Crystal.'
arch=(x86_64 aarch64)
url="https://github.com/the-cry-labs/plombir"
license=(MPL-2.0)
depends=(gc glibc libgcc libxml2 libyaml openssl pcre2 zlib)
makedepends=('crystal>=1.21.0' shards)
source=("$pkgname-$pkgver.tar.gz::https://github.com/the-cry-labs/plombir/archive/v$pkgver.tar.gz")
sha256sums=('87311d903cd34a6be12698ab4f8ef2d98bbf65608e3266d49aa6cd7c42230265')

build() {
	cd "$pkgname-$pkgver"

	export CRYSTAL_CACHE_DIR="$srcdir/.crystal-cache"

	shards build --production --release --link-flags="$LDFLAGS"
}

check() {
	cd "$pkgname-$pkgver"

	export CRYSTAL_CACHE_DIR="$srcdir/.crystal-cache"

	crystal spec
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 bin/plombir -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
