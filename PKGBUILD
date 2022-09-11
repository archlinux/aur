# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=eyedropper
pkgver=0.2.0
_commit=607fbf05900a37187b3dc5a5050892dac19cb547 # tags/v0.2.0
pkgrel=1
pkgdesc='A simple to use color picker and editor'
arch=(x86_64)
url=https://github.com/FineFindus/eyedropper
license=(GPL3)
depends=(libadwaita gtk4)
makedepends=(rust git meson)
checkdepends=(appstream-glib)
source=("git+$url#commit=$_commit")
md5sums=(SKIP)

pkgver() {
	cd "$pkgname"
	git describe --tags | sed 's/v//'
}

build() {
	arch-meson "$pkgname" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
