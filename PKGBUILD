# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/semplice/alan2.git"
_gitbranch=master
_gitname=alan2

pkgname="$_gitname-git"
pkgver=2.0.0.1
pkgrel=1
pkgdesc="An openbox menu builder."
arch=(i686 x86_64)
url="https://github.com/semplice/alan2"
license=('LGPL')
groups=()
depends=('python2')
makedepends=('')
provides=("${pkgname%}" "${pkgname%-git}")
conflicts=("${pkgname%}" "${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python2 setup.py install --root="${pkgdir}" --optimize=1
}
