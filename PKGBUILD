# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
_release=beta
_target=aur

pkgname=makedeb-beta
pkgver=8.3.1
pkgrel=1
pkgdesc="The modern packaging tool for Debian archives (${_release} release)"
arch=('any')
license=('GPL3')
depends=('tar' 'binutils' 'lsb-release' 'dpkg' 'makedeb-makepkg-beta')
makedepends=('asciidoctor' 'git' 'make' 'jq')
conflicts=('makedeb' 'makedeb-alpha')
url="https://github.com/makedeb/makedeb"

source=("makedeb::git+${url}/#tag=v${pkgver}-${pkgrel}-${_release}")
sha256sums=('SKIP')

prepare() {
	cd makedeb/
	make prepare PKGVER="${pkgver}" RELEASE="${_release}" TARGET="${_target}"
}

package() {
	cd makedeb/
	make package DESTDIR="${pkgdir}"
}
