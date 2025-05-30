# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=htpasswd
pkgver=1.18p1
pkgrel=1
pkgdesc="OpenBSD's standalone htpasswd ported to Linux"
arch=(x86_64 aarch64)
url="https://git.sr.ht/~shtrophic/htpasswd-portable"
license=('ISC')
depends=(libbsd nettle)
makedepends=(meson)
provides=()
conflicts=(apache apache-tools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc")
sha256sums=('d84f56e5c1446f1226ead594df263745e35e7edea79eddb2804c0bbc85f63bda'
            'SKIP')
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)

build() {
    arch-meson "$pkgname-portable-$pkgver" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
    install -Dm 644 "$pkgname-portable-$pkgver/COPYING" -t "$pkgdir/usr/share/licenses/$pkgname"
}
