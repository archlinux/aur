# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=pika-backup
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple backups based on borg"
arch=('x86_64')
url="https://gitlab.gnome.org/World/pika-backup"
license=('GPL')
depends=('borg' 'gtk3')
makedepends=('cargo' 'meson')
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('4f98d22a8132f6d63ae36eba3158ebaf6a24aa0862858c54cb02f6dbcafe5637')

build() {
	arch-meson "$pkgname-v$pkgver" build
	meson compile -C build
}

check() {
	#meson test -C build

	cd "$pkgname-v$pkgver"
	cargo test
}

package() {
	DESTDIR="$pkgdir" meson install -C build
}
