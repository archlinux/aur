# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>

_pkgname=aurutils-extra
pkgname=$_pkgname-git
pkgver=r86.c175268
pkgrel=1
pkgdesc="carlsmedstad’s custom aurutils scripts"
arch=('any')
url="https://github.com/carlsmedstad/$_pkgname"
license=('MIT')
provides=($_pkgname)
conflicts=($_pkgname)
depends=('bash')
makedepends=('git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
	cd $_pkgname
	sed -i 's/PROGNM =/PROGNM ?=/' Makefile
}

package() {
	cd $_pkgname
	PREFIX="$pkgdir/usr" PROGNM=$pkgname make install
}
