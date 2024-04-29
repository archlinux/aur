# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=puffin
pkgver=1.3.0
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
sha256sums=('41592087eeadfc5655f7231ec5d4d18d1d41bbb5daec03eda50f347375fe3daa')

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
