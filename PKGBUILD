# Maintainer: shtrophic <aur at shtrophic dot net>

pkgname=wicuvanity
pkgver=1.2
pkgrel=3
pkgdesc='Generate wireguard vanity keys on your Nvidia GPU'
arch=('x86_64')
url='https://git.sr.ht/~shtrophic/wicuvanity'
license=('MIT')
makedepends=(meson cmake cxxopts)
depends=(cuda)

source=(
	"$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
	"$pkgname-$pkgver.tar.gz.asc::$url/archive/$pkgver.tar.gz.asc"
)
validpgpkeys=(10F1CC925057D456798EBF9C1B3EB6FE2D338B4A)
sha256sums=('88dc3bdef3459a647eb9bed97d29fcecad8300771882c1f818924a7e05be46ef'
            'SKIP')

build() {
	arch-meson "$pkgname-$pkgver" builddir -Db_pie=false
	meson compile -C builddir
}

package() {
	meson install -C builddir --destdir "$pkgdir"
	install -Dm 644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "$pkgname-$pkgver/README.md" -t "$pkgdir/usr/share/doc/$pkgname"
}
