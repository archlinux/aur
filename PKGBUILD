# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Bogdan Szczurek <thebodzio@gmail.com>

pkgname=lua-md5
pkgver=1.2
pkgrel=2
pkgdesc="Basic cryptographic facilities for Lua."
arch=('i686' 'x86_64')
url="https://github.com/keplerproject/md5"
license=('MIT')
depends=('lua')
source=(https://github.com/keplerproject/md5/archive/v${pkgver}.tar.gz LICENSE)

build() {
	cd ${srcdir}/md5-${pkgver}
	./configure
	sed -i "s|5.1|5.3|" config
	make || return 1
}

package() {
	cd ${srcdir}/md5-${pkgver}
	sed -i "s|\(PREFIX = \)|\1${pkgdir}|" config
	make install || return 1
	install -Dm644 ${srcdir}/LICENSE \
		${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

md5sums=('c166f8a983401802a86655a8c733441e'
         '9ac505254abc686b34763c2118dc2e1b')
