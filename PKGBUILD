# Maintainer: Florian Schweiger <mpkmpoza@duck.com>
upstream_name=actions-for-nautilus
pkgname="$upstream_name-git"
pkgver=1.7.1.r2.g708051e
pkgrel=1
pkgdesc='Nautilus extension to add arbitrary actions to the file selection context menu'
arch=('x86_64')
url='https://github.com/bassmanitram/actions-for-nautilus'
license=('Apache')
depends=('nautilus' 'python-nautilus' 'python-gobject' 'procps-ng' 'jquery')
makedepends=('git' 'sed')
optdepends=()
provides=()
conflicts=('filemanager-actions')
backup=("~/.local/share/actions-for-nautilus/config.json")
options=()
install=
changelog=
source=('git+https://github.com/bassmanitram/actions-for-nautilus.git')
noextract=()
sha256sums=('SKIP')
prepare() {
	sed -Ei 's#(^.*LOC=)\$\(.+ALLOC\)#\1/usr/share#' "$srcdir/$upstream_name/Makefile"
}
pkgver() {
	cd "$upstream_name"
	git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}
package() {
	cd "$upstream_name"
	make GLOBALLOC="$pkgdir/usr/share" install_global
}
