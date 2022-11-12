# Maintainer: Dušan Simić <dusan.simic1810@gmail.com>

pkgname=health
_reponame=Health
pkgver=0.94.0
pkgrel=3
pkgdesc="A health tracking app for the GNOME desktop"
arch=(x86_64)
url=https://gitlab.gnome.org/Cogitri/Health
license=(GPL3)
depends=(libadwaita gtk4)
checkdepends=(appstream-glib)
makedepends=(meson rust blueprint-compiler python-gobject)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_reponame-$pkgver.tar.gz"
        "blueprint_version.patch")
sha512sums=('2cf4314de185c2ad8c42cd51385e7b9ab895932a429e6afb2ece29f24da951b49cb5e8ef184c377cc48a1e6bf6f997c0cd539623a4c5603e91dff70219c4bcab'
            'c37665c6c54cf0bc427aa93cb9186be3ec657a63765e149283c92077937312034cffb5231262423421b4c71eedc066e2a83f33f79b62919c5b937c7a8f32280c')

prepare() {
	cd "$_reponame-$pkgver"
	patch -p1 -i "$srcdir/blueprint_version.patch"
}

build() {
	arch-meson "$_reponame-$pkgver" build
	meson compile -C build
}

check() {
	# meson test -C build --print-errorlogs
	:
}

package() {
	meson install -C build --destdir "$pkgdir"
}
