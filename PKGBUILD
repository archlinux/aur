# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/semplice/bake.git"
_gitbranch="master"
_gitname="bake"

pkgname="$_gitname-sl-git"
pkgver=0
pkgrel=1
pkgdesc="An easy to use build system. Designed to be make/autotools for the 21st century. (Semplice Linux Fork)"
arch=('i686' 'x86_64')
url="https://github.com/semplice/bake"
license=('LGPL')
groups=()
depends=()
makedepends=('itstool' 'vala')
provides=("${pkgname%-sl-git}")
conflicts=("${pkgname%}" "${pkgname%-sl-git}")
replaces=()
backup=()
options=()
install=
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-sl-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-sl-git}"
	git merge --no-edit origin/semplice
	git merge --no-edit origin/python_version
	git merge --no-edit origin/gir_lookup
}

build() {
	cd "$srcdir/${pkgname%-sl-git}"
	make
    ./bake-bootstrap --configure install-directory="$pkgdir/"
}

package() {
	cd "$srcdir/${pkgname%-sl-git}"
	./bake-bootstrap install
}
