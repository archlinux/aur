# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=dynamic-wallpaper
pkgver=0.0.1
_commit=9cc27b273a900e3ee8777887bb27bd531a6e91ea
pkgrel=1
pkgdesc='Dynamic wallpaper creator for Gnome 42'
arch=(any)
url=https://github.com/dusansimic/dynamic-wallpaper
license=(GPL2)
depends=(python gtk4 libadwaita)
makedepends=(meson git)
checkdepends=(appstream-glib)
source=("git+$url#commit=$_commit"
        "appstream.patch")
md5sums=('SKIP'
         '4891de83cfdbac11b62b422f55352200')

prepare() {
	cd "$pkgname"
	patch -p1 -i "$srcdir/appstream.patch"
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
