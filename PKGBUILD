pkgname=wlsunset-git
pkgver=0.1.0.r0.0569fb4
pkgrel=1
pkgdesc="Day/night gamma adjustments for Wayland"
arch=('x86_64')
url="https://git.sr.ht/~kennylevinsen/wlsunset"
license=('MIT')
depends=('wayland' 'wayland-protocols')
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=('wlsunset')
conflicts=('wlsunset')
source=("$pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"

# Git, tags available
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
#	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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
