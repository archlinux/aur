# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera-plugin-autostart.git"
_gitbranch=master
_gitname=vera-plugin-autostart

pkgname="$_gitname-git"
pkgver=r1.3872460
pkgrel=1
pkgdesc="autostart plugin for vera"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera-plugin-autostart"
license=('LGPL')
groups=()
depends=('vera-git' 'libgee')
makedepends=('bake')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-plugin-autostart')
replaces=()
backup=()
options=()
install=vera-plugin-autostart.install
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	bake --configure install-directory="$pkgdir/"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	bake install
}
