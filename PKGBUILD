# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera-plugin-desktop.git"
_gitbranch=master
_gitname=vera-plugin-desktop

pkgname="$_gitname-git"
pkgver=0
pkgrel=1
pkgdesc="Desktop plugin for vera"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera-plugin-desktop"
license=('LGPL')
groups=()
depends=('vera-git' 'libx11' 'cairo')
makedepends=('bake')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-plugin-desktop')
replaces=()
backup=()
options=()
install=vera-plugin-desktop.install
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	bake --configure install-directory="$pkgdir/"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	bake install
}
