# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=eyedropper
pkgver=0.5.0
_commit=b00e06b72798ef07f8443a8e79ffa35a86733e07 # tags/v0.5.0
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
