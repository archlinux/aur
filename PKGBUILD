# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=gnome-passwordsafe-git
_gitname=PasswordSafe
pkgver=r420.05d2404
pkgrel=1
pkgdesc="A password manager for GNOME"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://gitlab.gnome.org/World/PasswordSafe"
depends=('gtk3' 'python-pykeepass-git' 'gobject-introspection')
makedepends=('git' 'meson' 'ninja')
source=("git+https://gitlab.gnome.org/World/PasswordSafe.git")
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
