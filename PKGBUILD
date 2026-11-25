# Maintainer: Julian Daube <joposter at gmail dot com>
# Contributor: Julian Daube <joposter at gmail dot com>

pkgname=libmacspoof
pkgver=1.1.0
pkgrel=1
pkgdesc="Preloadable library for spoofing the MAC address"
arch=("x86_64")
url="https://aur.archlinux.org/packages/libmacspoof"
license=("0BSD")
depends=("glibc")
provides=("libmacspoof.so")
source=("macspoof.c" "LICENSE")
sha256sums=("98f4191156225946df91e4493a68092ea3a9d3656c29ba70c12afd8b85851505"
	"7056c04df17a4e0f0bac9f787f347c9cd892cee6323d1c89528090afd0b934a3")

build() {
	gcc $CPPFLAGS $CFLAGS -Wall -Wextra -fPIC -shared $LDFLAGS \
		-Wl,-soname,libmacspoof.so.1 -o "libmacspoof.so.$pkgver" macspoof.c
}

package() {
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 755 "libmacspoof.so.$pkgver" -t "$pkgdir/usr/lib/"
	ln -s "libmacspoof.so.$pkgver" "$pkgdir/usr/lib/libmacspoof.so.1"
	ln -s libmacspoof.so.1 "$pkgdir/usr/lib/libmacspoof.so"
}
