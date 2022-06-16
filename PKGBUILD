# Maintainer: Guoyi Zhang
_basename=notekit
pkgname="${_basename}-git"
pkgver=r207.18b708d
pkgrel=1
pkgdesc="A GTK3 hierarchical markdown notetaking application with tablet support."
arch=("x86_64" "aarch64" "i686" "armv7h" "s390x")
url="https://github.com/blackhole89/notekit"
license=("GPL-3.0")
depends=("desktop-file-utils" "clatexmath" "gtkmm3" "gtksourceviewmm>=3.18" "jsoncpp" "zlib")
makedepends=("git" "meson" "appstream-glib")
provides=("${_basename}")
conflicts=("${_basename}" "${_basename}-git")
source=("${_basename}::git+https://github.com/blackhole89/notekit.git")
sha256sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "${srcdir}/${_basename}"
	arch-meson . _build
}

build() {
	cd "${srcdir}/${_basename}"
	ninja -C _build
}

package() {
	cd "${srcdir}/${_basename}"
	DESTDIR="${pkgdir}" meson install -C _build
}
