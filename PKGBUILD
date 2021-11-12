# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
_release=alpha
_target=aur

pkgname=makedeb-makepkg-alpha
pkgver=8.12.1
pkgrel=1
pkgdesc="ABS packaging utility"
arch=(any)
depends=('awk' 'libarchive' 'bzip2' 'coreutils' 'fakeroot' 'file' 'findutils' 'gettext' 'gnupg' 'grep' 'gzip' 'sed' 'ncurses' 'xz')
makedepends=('asciidoctor' 'git' 'make' 'jq')
conflicts=('makedeb-makepkg' 'makedeb-makepkg-beta')
license=('GPL2')
url="https://github.com/makedeb/makepkg"

source=("makepkg::git+${url}/#tag=v${pkgver}-${pkgrel}-${_release}")
sha256sums=('SKIP')

prepare() {
	cd makepkg/
	make prepare TARGET="${_target}"
}

package() {
	cd makepkg/

    if [[ "${_target}" == "local" || "${_target}" == "mpr" ]]; then
        make package DESTDIR="${pkgdir}" PACMAN_BINARY=1
    else
	    make package DESTDIR="${pkgdir}"
    fi
}
