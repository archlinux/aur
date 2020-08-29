# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.1.1
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64')
url="https://gitlab.gnome.org/World/pika-backup"
license=('GPL')
depends=('borg' 'gtk3')
makedepends=('cargo' 'meson')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('7f515c2ca174e0e61430c877da9f8f5fb45ccf7d7116cbbf24a1c678fd0863f1')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	#meson test -C build

	cd "$pkgname-v$pkgver"
	cargo test --release
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
