# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=passwordsafe-git
_gitname=PasswordSafe
pkgver=0.9.2.r44.g1aa1945
pkgrel=1
pkgdesc="A password manager for GNOME"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/fseidl/KeepassGtk"
depends=('gtk3' 'python-pykeepass' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja')
source=("https://gitlab.gnome.org/fseidl/KeepassGtk.git")
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
