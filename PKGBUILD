# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=vanilla-backgrounds-git
pkgver=continuous.r0.g54ac40b
pkgrel=1
pkgdesc='Collection of light and dark backgrounds for Vanilla OS'
arch=(any)
url='https://github.com/Vanilla-OS/vanilla-backgrounds'
license=('CCPL:by-sa-4.0' 'CCPL:by-4.0')
depends=(webp-pixbuf-loader)
makedepends=(
	git
	glib2
	meson
)
provides=(vanilla-backgrounds)
conflicts=(vanilla-backgrounds)
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
	cd vanilla-backgrounds
	git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson vanilla-backgrounds build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
