# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=puffin
pkgver=2.1.3
pkgrel=1
pkgdesc='TUI for hledger to manage personal finances'
arch=(x86_64)
url="https://github.com/siddhantac/$pkgname"
# https://github.com/siddhantac/puffin/issues/26
# license=()
depends=(glibc
         hledger)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('fa9c10eae18e304d9996188faf179e911de49c7307a69ee42ae700ab60e8f63a')

build() {
	cd "$_archive"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
		-o "$pkgname"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
}
