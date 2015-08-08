# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera-power-manager.git"
_gitbranch=master
_gitname=vera-power-manager

pkgname="$_gitname-git"
pkgver=0
pkgrel=1
pkgdesc="Vera power manager"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera-power-manager"
license=('LGPL')
groups=()
depends=('vera' 'python')
makedepends=('')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-power-manager')
replaces=()
backup=()
options=()
install=vera-power-manager.install
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	python setup.py install --root="${pkgdir}" --optimize=1
}
