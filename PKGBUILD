# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera-control-center.git"
_gitbranch=master
_gitname=vera-control-center

pkgname="$_gitname-git"
pkgver=0
pkgrel=1
pkgdesc="Vera control center"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera-control-center"
license=('LGPL')
groups=()
depends=('vala' 'libpeas' 'gtk3' 'libgee06' 'vera-xsettings-git' 'gobject-introspection')
makedepends=('bake')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-control-center')
replaces=()
backup=()
options=()
install=vera-control-center.install
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
