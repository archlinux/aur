# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>

_gitroot="git://github.com/vera-desktop/vera.git"
_gitbranch=master
_gitname=vera

pkgname="$_gitname-git"
pkgver=1.0.2.1
pkgrel=1
pkgdesc="A simple, lightweight, GTK3 based desktop environment"
arch=(i686 x86_64)
url="https://github.com/vera-desktop/vera"
license=('LGPL')
groups=()
depends=('vala' 'libpeas' 'gtk3' 'libgee06' 'vera-xsettings-git' 'libxss-vapi-git' 'gobject-introspection')
makedepends=('bake-sl')
provides=("${pkgname%}")
conflicts=("${pkgname%}" 'vera-desktop-environment')
replaces=()
backup=()
options=()
install=vera.install
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --abbrev=0 | sed 's/[A-Za-z]*//g;s/[!@#\$%^&*()/]//g;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	bake -d --configure install-directory="$pkgdir/"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	bake install
}
