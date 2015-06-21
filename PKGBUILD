# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=populate-git
pkgver=20.daa13fb
pkgrel=2
pkgdesc="A simple game, written in vala"
arch=('any')
url="https://github.com/alsoijw/populate"
license=('GPL3')
depends=('libgee' 'gtk3')
makedepends=('vala')
source=(${pkgname}::git+"${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${pkgname}
	cat Makefile | sed s/gee-1.0/gee-0.8/ | sed 6d > tempfile
	cp tempfile Makefile
	make
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp ${srcdir}/${pkgname}/populate ${pkgdir}/usr/bin/
}
