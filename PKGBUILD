# Maintainer: Falk Alexander Seidl <fseidl@gnome.org>

pkgname=gnome-passwordsafe
_gitname=PasswordSafe
pkgver=3.30.1
pkgrel=1
pkgdesc="A password manager for GNOME"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/PasswordSafe"
depends=('gtk3' 'python-pykeepass' 'python-construct' 'gobject-introspection' 'libhandy')
makedepends=('git' 'meson' 'ninja')
conflicts=('gnome-passwordsafe-git')
source=("git+https://gitlab.gnome.org/World/PasswordSafe.git")
md5sums=('SKIP')
 
pkgver() {
	cd "${srcdir}/${_gitname}/"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_gitname}/"
	arch-meson . _build --prefix=/usr
	ninja -C _build
}

package() {
	cd "${srcdir}/${_gitname}/"
	DESTDIR="${pkgdir}" ninja -C _build install
}

