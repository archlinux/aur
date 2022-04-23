# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=42.1
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
arch=(x86_64 aarch64)
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
depends=(
	enchant
	gtksourceview5
	libadwaita
)
makedepends=(
	itstool
	meson
)
options=(debug)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
b2sums=('d474863171074555366ae2cfe779131c23e0fb3e89764060a135296bd7d70d49d2c2562d16e27ae5d33b8dbcae3091495fef22dc298b018c170b8f1f1de7d015')

build() {
	arch-meson ${pkgname}-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs || true
}

package() {
	DESTDIR="${pkgdir}" meson install -C build

	rm -rf "${pkgdir}/usr/share/gtksourceview-5"
}
