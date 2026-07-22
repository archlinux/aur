# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=hledger-lsp
pkgver=0.2.51
pkgrel=1
pkgdesc='Language Server Protocol (LSP) implementation for hledger journal files'
arch=(x86_64)
license=(MIT)
url="https://github.com/juev/$pkgname"
depends=(glibc)
makedepends=(go)
_archive="$pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('4e7de143bcc473856fbcf9b13d8777384cd2f338d353053126d13ec5306a63bd')

build() {
	cd "$_archive"
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"$LDFLAGS\"" \
		"./cmd/$pkgname"
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
