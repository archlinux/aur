# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=fractal-git
_gitname=fractal
pkgver=r582.d6145e8
pkgrel=1
pkgdesc="Matrix.org gtk+ client"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/fractal"
depends=('gtk3')
conflics=('fractal')
provides=('fractal')
makedepends=('gtk3' 'rust' 'pkg-config' 'git' 'meson')
source=("git+https://gitlab.gnome.org/World/fractal.git")
md5sums=('SKIP')
 
pkgver() {
	cd "${srcdir}/${_gitname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}/"
	meson . _build --prefix=/usr
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}
