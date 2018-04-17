# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=fractal-git
_gitname=fractal
pkgver=r563.b26ffa9
pkgrel=1
pkgdesc="Matrix.org gtk+ client"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/fractal"
depends=('gtk3')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson')
source=("https://gitlab.gnome.org/World/fractal.git")
md5sums=('SKIP')
 
pkgver() {
	cd "${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/"
	meson . _build --prefix=/usr/local
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}
