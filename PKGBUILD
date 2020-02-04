# Maintainer: Felix Bühler <account at buehler dot rocks>

pkgname=newsflash-git
_pkgname=news_flash_gtk
pkgver=402.510b8c6
pkgrel=1
pkgdesc="The spiritual successor to FeedReader"
arch=(any)
url="https://gitlab.com/news-flash/news_flash_gtk"
license=(GPL3)
depends=()
makedepends=(rust cargo meson)
source=("git+https://gitlab.com/news-flash/news_flash_gtk.git")
sha512sums=("SKIP")

pkgver() {
	cd "${_pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${_pkgname}"
	rm -rf _build
	arch-meson _build
	ninja -C _build
}

package() {
	cd "${_pkgname}"
	env DESTDIR="$pkgdir" ninja -C _build install
}
