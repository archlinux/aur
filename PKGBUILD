# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=uresourced
pkgver=0.3.0
pkgrel=1
pkgdesc="Dynamically allocate resources to the active user"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://gitlab.freedesktop.org/benzea/uresourced"
license=('GPL')
depends=('glib2' 'systemd')
makedepends=('meson')
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('d9f15332f737e0d24c1381ed3baf5409623158fdfed567e749d47fbb987f5d49')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build

	cd "$pkgname-v$pkgver"
	install -Dm644 NEWS.md README -t "$pkgdir/usr/share/doc/$pkgname"
}
