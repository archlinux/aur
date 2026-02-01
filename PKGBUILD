# Maintainer: Egor Vorontsov <sdoregor@sdore.me>

_gitname=Crosspipe
_pkgbase=crosspipe
pkgname=${_pkgbase}-git
pkgver=r7.3a89932
pkgrel=1
pkgdesc="A visual graph manager for PipeWire, built with GTK4/Libadwaita and Vala, following the GNOME Human Interface Guidelines (git version)"
arch=('x86_64')
url="https://github.com/dp0sk/Crosspipe"
license=('GPL-3.0')
depends=(gtk4 libadwaita libgee libxml2 pipewire)
makedepends=(git meson vala)
provides=(${_pkgbase})
conflicts=(${_pkgbase})
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"

	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson "${_gitname}" 'build/'
	meson compile -C 'build/'
}

check() (
	meson test -C 'build/' --print-errorlogs
)

package() {
	meson install -C 'build/' --destdir "${pkgdir}"
}
