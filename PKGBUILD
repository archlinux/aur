# Maintainer: Ian Brunelli <ian@brunelli.me>

pkgname=prefixsuffix-git
_gitname=prefixsuffix
pkgver=0.6.9.r23.gf1692a7
pkgrel=1
pkgdesc='A GUI application that renames batches of files by changing the beginning or end of their names.'
arch=('i686' 'x86_64')
license=('GPL2')
url="https://github.com/murraycu/${_gitname}"
depends=('gtkmm3')
makedepends=('git' 'gnome-common' 'mm-common')
options=('!emptydirs')
install=prefixsuffix.install
source=("git://github.com/murraycu/${_gitname}.git")
md5sums=('SKIP')
conflicts=('prefixsuffix')
provides=("prefixsuffix=$pkgver")

pkgver() {
	cd "${_gitname}"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${_gitname}"
	./autogen.sh --prefix=/usr --disable-schemas-compile
	make
}

package() {
	cd "$srcdir/${_gitname}"
	make DESTDIR="${pkgdir}" install
}
