# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=gnome-passwordsafe-git
_gitname=PasswordSafe
pkgver=0.9.3
pkgrel=2
pkgdesc="A password manager for GNOME"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/PasswordSafe"
depends=('gtk3' 'python-pykeepass' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja')
source=("git+https://gitlab.gnome.org/World/PasswordSafe.git")
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
