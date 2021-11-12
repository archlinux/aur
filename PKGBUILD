# Maintainer: Hunter Wittenborn <hunter@hunterwittenborn.com>
_release=alpha
_target=aur

pkgname=makedeb-alpha
pkgver=8.3.2
pkgrel=1
pkgdesc="The modern packaging tool for Debian archives (${_release} release)"
arch=('any')
license=('GPL3')
depends=('tar' 'binutils' 'lsb-release' 'dpkg')
makedepends=('asciidoctor' 'git' 'make' 'jq')
conflicts=('makedeb' 'makedeb-beta' 'makedeb-makepkg-alpha')
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
