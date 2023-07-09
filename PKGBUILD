# Maintainer: itshog <itshog@protonmail.com>

pkgname=ps3iso-utils-git
_pkgname=ps3iso-utils
pkgver=r29.8780909
pkgrel=1
pkgdesc="Estwald's PS3 utilities: extractps3iso, makeps3iso, patchps3iso, splitps3iso"
arch=("x86_64")
url="https://github.com/bucanero/ps3iso-utils"
license=("GPL3")
depends=("glibc")
optdepends=()
makedepends=("git")
provides=("extractps3iso" "makeps3iso" "patchps3iso" "splitps3iso")
conflicts=()
source=("git+$url")
sha256sums=("SKIP")

pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$_pkgname"
	make -C extractps3iso LDFLAGS+="-Wl,-z,now"
	make -C makeps3iso LDFLAGS+="-Wl,-z,now"
	make -C patchps3iso LDFLAGS+="-Wl,-z,now"
	make -C splitps3iso LDFLAGS+="-Wl,-z,now"
}

package() {
	cd "$_pkgname"
	install -Dm755 -t "$pkgdir/usr/bin" "extractps3iso/extractps3iso"
	install -Dm755 -t "$pkgdir/usr/bin" "makeps3iso/makeps3iso"
	install -Dm755 -t "$pkgdir/usr/bin" "patchps3iso/patchps3iso"
	install -Dm755 -t "$pkgdir/usr/bin" "splitps3iso/splitps3iso"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
	install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
