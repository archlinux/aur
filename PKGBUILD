# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera-plugin-power.git"
_gitbranch=master
_gitname=vera-plugin-power

pkgname="$_gitname-git"
pkgver=0
pkgrel=1
pkgdesc="Power plugin for vera"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera-plugin-power"
license=('LGPL')
groups=()
depends=('vera' 'upower')
makedepends=('bake')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-plugin-power')
replaces=()
backup=()
options=()
install=vera-plugin-power.install
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
