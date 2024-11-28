# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=puffin
pkgver=2.1.1
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
sha256sums=('67bcc870bc6321f534996d9ca6983ee425e8bc4f40e28fe42f2063930f2b31b7')

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
