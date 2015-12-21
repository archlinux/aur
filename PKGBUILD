# Maintainer: Anthony Samartsev <kycok@archlinux.info>

pkgname=populate-git
pkgver=39.4170011
pkgrel=1
pkgdesc="A simple game, written in vala"
arch=('any')
url="https://github.com/alsoijw/populate"
license=('GPL3')
depends=('gtk3' 'libgee')
makedepends=('git' 'vala')
source=(${pkgname}::git+"${url}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
	cd ${srcdir}/${pkgname}
	valac `find src/ -type f` --pkg gee-0.8 --pkg gtk+-3.0 -X -lm -o populate
}

package() {
	mkdir -p $pkgdir/usr/bin
	cp ${srcdir}/${pkgname}/populate ${pkgdir}/usr/bin/
}
