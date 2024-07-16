# Maintainer: SelfRef <arch@selfref.dev>
_basename=showtime
pkgname=${_basename}
pkgver=46.3
pkgrel=3
pkgdesc="Video Player - Watch without distraction"
arch=('x86_64')
url="https://apps.gnome.org/Showtime/"
license=('GPL')
depends=('python' 'python-gobject' 'gtk4' 'libadwaita' 'gst-plugin-gtk4')
makedepends=('git' 'meson' 'blueprint-compiler')
provides=("$_basename")
conflicts=("$_basename")
source=("$_basename::git+https://gitlab.gnome.org/GNOME/Incubator/showtime.git#tag=$pkgver")
sha256sums=('49cfd20d2e70cf43bc706fbb5a28710fdddfda6415e74a2a70a0aa2380233fba')

prepare() {
	meson subprojects download --sourcedir=$_basename
}

build() {
	arch-meson $_basename build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"
}
