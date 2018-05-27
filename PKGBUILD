# Maintainer: Falk Alexander Seidl <fa@terminal.run>

pkgname=keepassgtk
_gitname=KeepassGtk
pkgver=r105.7ddb42d
pkgrel=1
pkgdesc="An eye candy password manager for Linux (Keepass v.4)"
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/TerminalDotRun/KeepassGtk"
depends=('gtk3' 'python-pykeepass')
makedepends=('git' 'meson' 'ninja')
source=("git+https://github.com/TerminalDotRun/KeepassGtk.git")
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
