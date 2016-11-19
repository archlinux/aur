# Maintainer: Anna Ivanova <kalterfx@gmail.com>

pkgbase=arc-gotham-gtk-theme-git
_pkgname=arc-theme-gotham
pkgname=('arc-gotham-gtk-theme-git' 'arc-gotham-solid-gtk-theme-git')
pkgver=636.dc4fdd8
pkgrel=1
arch=('any')
url="https://github.com/9sevendesign/$_pkgname"
license=('GPL3')
depends=('gtk3' 'gtk-engine-murrine')
optdepends=('arc-icon-theme')
source=("git+https://github.com/9sevendesign/arc-theme-gotham.git")
md5sums=('SKIP')

pkgver() {
	cd "$_pkgname"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd "$_pkgname"
	./autogen.sh --prefix=/usr
}

package_arc-gotham-gtk-theme-git() {
	pkgdesc="A flat theme with transparent elements based on gotham vim scheme"
	conflicts=('arc-gtk-theme')
	provides=('arc-gtk-theme')
	replaces=('gtk-theme-arc')

	cd "$_pkgname"
	./configure --prefix=/usr
	make DESTDIR="${pkgdir}" install
}

package_arc-gotham-solid-gtk-theme-git() {
	pkgdesc="A flat theme for GTK 3, GTK 2 and Gnome-Shell (without transparency)"
	conflicts=('arc-gtk-theme' 'gtk-theme-arc' 'arc-gotham-gtk-theme')
	provides=('arc-gtk-theme' 'arc-gotham-gtk-theme')
	replaces=('gtk-theme-arc-solid')

	cd "$_pkgname"
	./configure --prefix=/usr --disable-transparency
	make DESTDIR="${pkgdir}" install
}
