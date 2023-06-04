# Contributor: Hunter Wittenborn <hunter@hunterwittenborn.com>
# Contributor: Asuka Minato

_release=stable
_target=arch

pkgname=makedeb
pkgver=16.0.0
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

source=("https://github.com/makedeb/makedeb/archive/refs/tags/v${pkgver}-stable.tar.gz")
sha256sums=('c87e3f56e867a165c927f7e34ed23bf29f369628dec4fd0ccd4738e512baf4ff')

prepare() {
	pushd makedeb-${pkgver}-stable
	make prepare PKGVER="${pkgver}" RELEASE="${_release}" TARGET="${_target}"
}

package() {
	pushd makedeb-${pkgver}-stable
	make package DESTDIR="${pkgdir}" TARGET="${_target}"
	rm -vrf $pkgdir/etc/makepkg* $pkgdir/usr/bin/makepkg*
}
