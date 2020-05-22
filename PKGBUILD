# Maintainer: Felix Bühler <account at buehler dot rocks>

pkgname=newsflash
_pkgname=news_flash_gtk
pkgver=1.0+rc1
pkgrel=1
pkgdesc="The spiritual successor to FeedReader"
arch=(any)
url="https://gitlab.com/news-flash/news_flash_gtk"
license=(GPL3)
depends=()
makedepends=(cargo libhandy meson rust webkit2gtk)
conflicts=(newsflash-git)
_commit=f69f2bbafafecb4e0a4b9facf30f510880012c8a
source=("git+https://gitlab.com/news-flash/news_flash_gtk.git#commit=$_commit")
sha512sums=("SKIP")

pkgver() {
  cd "${_pkgname}"
  git describe --tags | sed 's/^v//;s/-/+/g'
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
