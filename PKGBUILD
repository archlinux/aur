# Maintainer: David Schury <dasc@posteo.de>

pkgname=otrtool-git
_pkgname=otrtool
pkgver=1.1.0.16.g2feb58d
pkgrel=1
pkgdesc="Open source decoder for .otrkey files (onlinetvrecorder.com)"
arch=('any')
url="https://github.com/otrtool/otrtool"
license=('custom:CC0')
depends=('curl' 'libmcrypt')
makedepends=('git')
conficts=('otrtool')
provides=('otrtool')
source=("git+https://github.com/$_pkgname/$_pkgname.git"
        "destdir.patch"
        "mkdir.patch")
md5sums=('SKIP'
         'fe06c0ed4ea003fae2cf2f0391f04a32'
         '6917038171b9aa27f3a574ec5c9f8646')

pkgver() {
	cd "$_pkgname"
	git describe --tags | sed -e 's|-|.|g' -e 's|^v||'
}

prepare() {
	cd "$_pkgname"
	patch -Np1 -i "../destdir.patch"
	patch -Np1 -i "../mkdir.patch"
}

build() {
	cd "$_pkgname"
	make PREFIX=/usr
}

package() {
	cd "$_pkgname"
	make PREFIX=/usr DESTDIR=$pkgdir install
}

