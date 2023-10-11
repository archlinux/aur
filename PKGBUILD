# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=eyedropper
pkgver=1.0.0
_commit=0658771fd44c180299e8431610f385a1e5d65c63 # tags/v1.0.0
pkgrel=1
pkgdesc='A simple to use color picker and editor'
arch=(x86_64)
url=https://github.com/FineFindus/eyedropper
license=(GPL3)
depends=(libadwaita gtk4)
makedepends=(rust git meson blueprint-compiler)
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
