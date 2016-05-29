# Maintainer: Link Dupont <link@fastmail.com>

pkgname=valadate-git
pkgver=1.0.r292.183ced8
pkgrel=1
pkgdesc="Test framework for the Vala programming language"
arch=('x86_64' 'i686')
url="http://github.com/chebizzaro/valadate"
license=('LGPL3')
groups=()
depends=('libxslt' 'json-glib')
makedepends=('git' 'libtool' 'gobject-introspection')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('valadate::git+https://github.com/chebizarro/valadate.git')
noextract=()
md5sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
