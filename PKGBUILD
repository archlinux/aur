# Maintainer: Gary DeLaney <gld1982ltd@gmail.com>
# Contributor: Joel Teichroeb <joel@teichroeb.net>

_gitroot="git://github.com/giucam/orbital.git"
_gitbranch=master
_gitname=orbital

_builddir=("${_gitname}/build")
_prefix="/usr"

pkgname="$_gitname-git"
pkgver=0.1.763
pkgrel=2
pkgdesc="A Wayland shell client"
arch=(i686 x86_64)
url="https://github.com/giucam/orbital"
license=('LGPL')
depends=('weston-orbital-git' 'qt5-tools' 'qt5-graphicaleffects' 'qt5-quickcontrols' 'qt5-wayland' 'oxygen-icons')
optdepends=('solid' 'alsa-lib')
makedepends=('git' 'cmake')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("${_gitname}::${_gitroot}#branch=${_gitbranch}")
sha1sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
    printf "%s.%s" "$(git describe --abbrev=0 --tags | sed 's/v//;s/\([^-]*-g\)/r\1/;s/-/./g')" "$(git rev-list --count HEAD)"
}

prepare() {
	mkdir -p "${_builddir}"
}

build() {
	cd "${_builddir}"
	cmake .. -DCMAKE_INSTALL_PREFIX="${_prefix}"
	make
}

package() {
	cd "${_builddir}"
	make DESTDIR=${pkgdir} install
}
