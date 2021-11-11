# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
_release=beta
_target=aur

pkgname=makedeb-makepkg-beta
pkgver=8.12.0
pkgrel=1
pkgdesc="ABS packaging utility"
arch=(any)
depends=('awk' 'libarchive' 'bzip2' 'coreutils' 'fakeroot' 'file' 'findutils' 'gettext' 'gnupg' 'grep' 'gzip' 'sed' 'ncurses' 'xz' 'makedeb-makepkg-beta')
makedepends=('asciidoctor' 'git' 'make' 'jq')
conflicts=('makedeb-makepkg' 'makedeb-makepkg-alpha')
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
