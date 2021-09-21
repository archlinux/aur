# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=gnome-text-editor
pkgver=41.0
pkgrel=1
pkgdesc='Simple text editor that focuses on session management'
url='https://gitlab.gnome.org/GNOME/gnome-text-editor'
license=(GPL3)
arch=(x86_64 aarch64)
depends=(
	enchant
	'glib2>=2.70.0'
	gtksourceview5
	libadwaita
)
makedepends=(meson)
_commit=${pkgver}
source=("${url}/-/archive/${_commit}/${pkgname}-${_commit}.tar.gz")
sha256sums=('67e84acb0b76c4018fe57612a633a4c8e5d38f9c18c80f50d0a1cf4e96587c1b')

build() {
	arch-meson ${pkgname}-${_commit} build
	meson compile -C build
}

# check() {
# 	meson test -C build --print-errorlogs
# }

package() {
	DESTDIR="${pkgdir}" meson install -C build

	rm -rf "${pkgdir}/usr/share/gtksourceview-5"
}
