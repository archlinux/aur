# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=keepassgtk-git
_gitname=KeepassGtk
pkgver=0.9.1.r8.g1f54804
pkgrel=1
pkgdesc="An eye candy password manager for Linux (Keepass v.4)"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/TerminalDotRun/KeepassGtk"
depends=('gtk3' 'python-pykeepass' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja')
source=("git+https://gitlab.gnome.org/fseidl/KeepassGtk.git")
md5sums=('SKIP')
 
pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
