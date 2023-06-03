# Maintainer: Felix Bühler <account at buehler dot rocks>

pkgname=newsflash-git
_pkgname=news_flash_gtk
pkgver=1301.7fc90cf
pkgrel=1
pkgdesc="The spiritual successor to FeedReader"
arch=(any)
url="https://gitlab.com/news-flash/news_flash_gtk"
license=(GPL3)
depends=(libadwaita webkitgtk-6.0)
makedepends=(git appstream-glib meson rust)
conflicts=(newsflash)
source=("git+https://gitlab.com/news-flash/news_flash_gtk.git")
sha512sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_pkgname}"
	#rm -rf _build
	arch-meson _build
	ninja -C _build
}

package() {
	cd "${_pkgname}"
	env DESTDIR="$pkgdir" ninja -C _build install
}
