# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=fractal-git
_gitname=fractal
pkgver=r1614.f39555b
pkgrel=1
pkgdesc="Matrix messaging app for GNOME written in Rust"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/GNOME/fractal"
depends=('gtk3' 'libhandy' 'gtksourceview3' 'gstreamer' 'gst-plugins-base-libs' 'gst-plugins-bad' 'gst-editing-services' 'gst-libav' 'gspell')
optdepends=('gnome-keyring: secrets service')
conflics=('fractal')
provides=('fractal')
makedepends=('rust' 'gst-editing-services' 'pkg-config' 'git' 'meson')
source=("git+https://gitlab.gnome.org/World/fractal.git")
md5sums=('SKIP')
 
pkgver() {
	cd "${srcdir}/${_gitname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/"
	arch-meson . _build
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}
