# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/g7/nala.git"
_gitbranch=master
_gitname=nala

pkgname="$_gitname-git"
pkgver=1.0.2.1
pkgrel=1
pkgdesc="A nala implementation written in vala."
arch=(i686 x86_64)
url="https://github.com/g7/nala"
license=('LGPL')
groups=()
depends=('vala')
makedepends=('bake-sl')
provides=("${pkgname%}")
conflicts=("${pkgname%}" '${pkgname%-git}')
replaces=()
backup=()
options=()
install=nala.install
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	bake --configure install-directory="$pkgdir/"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	bake install
}
