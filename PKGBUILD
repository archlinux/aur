# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
_release=beta
_target=aur

pkgname=makedeb-beta
pkgver=8.6.3
pkgrel=1
pkgdesc="A simplicity-focused packaging tool for Debian archives (${_release} release)"
arch=('any')
license=('GPL3')
depends=('awk' 'binutils' 'bzip2' 'coreutils' 'dpkg' 'fakeroot' 'file' 'findutils' 'gettext' 'gnupg' 'grep' 'gzip' 'libarchive' 'lsb-release' 'ncurses' 'sed' 'tar' 'xz')
makedepends=('asciidoctor' 'git' 'make' 'jq')
conflicts=('makedeb-makepkg' 'makedeb-makepkg-beta' 'makedeb-makepkg-alpha')
provides=('makedeb-makepkg' 'makedeb-makepkg-beta' 'makedeb-makepkg-alpha')
replaces=('makedeb-makepkg' 'makedeb-makepkg-beta' 'makedeb-makepkg-alpha')
url="https://github.com/makedeb/makedeb"

source=("makedeb::git+${url}/#tag=v${pkgver}-${pkgrel}-${_release}")
sha256sums=('SKIP')

prepare() {
	cd makedeb/
	make prepare PKGVER="${pkgver}" RELEASE="${_release}" TARGET="${_target}"
}

package() {
	cd makedeb/
	make package DESTDIR="${pkgdir}" TARGET="${_target}"
}
