# Maintainer:  Keating Reid <keating.reid@protonmail.com>
pkgname=libmowgli-2-git
pkgver=2.1.3.r42.g8be3be8
pkgrel=1
pkgdesc="A class library containing performance and usability oriented extensions to C."
arch=('i686' 'x86_64')
url="https://github.com/atheme/libmowgli-2"
license=('ISC')
depends=('openssl')
makedepends=('git')
provides=('libmowgli=2.1.3')
conflicts=("libmowgli")
source=("${pkgname}::git+https://github.com/atheme/libmowgli-2.git")
sha1sums=('SKIP')

pkgver() {
	cd $pkgname
	git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

