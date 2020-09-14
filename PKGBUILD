pkgname=wlsunset-git
pkgver=efa5b63e
pkgrel=1
pkgdesc="Day/night gamma adjustments for Wayland"
arch=('x86_64')
url="https://git.sr.ht/~kennylevinsen/wlsunset"
license=('MIT')
depends=('wayland')
makedepends=('git' 'meson' 'ninja')
provides=('wlsunset')
conflicts=('wlsunset')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
        cd "$pkgname"
	git rev-parse HEAD | cut -b1-8
}

build() {
	cd "$pkgname"
	arch-meson build
	ninja -C build
}

package() {
	cd "$pkgname"
	DESTDIR="$pkgdir" ninja -C build install
}
