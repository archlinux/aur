# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.3.8
pkgrel=1
pkgdesc="The PinYin Engine for IBus Input Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus' 'libsigc++2.0' 'boost')
makedepends=('intltool')
provides=('ibus-pinyin=1.3.2')
install=ibus-pinyin.install
source=(http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
        http://ibus.googlecode.com/files/pinyin-database-1.2.99.tar.bz2)
md5sums=('3cc746e0abfdcb2f1be3e688a78a3ca5'
         'd0951b8daa7f56a2cbd3b6b4e42532e0')

build() {
	ln -sf ${srcdir}/pinyin-database-1.2.99.tar.bz2 \
		${srcdir}/${pkgname}-${pkgver}/data/db/open-phrase
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr --libexecdir=/usr/lib/ibus \
		--enable-db-open-phrase || return 1
	make || return 1
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make NO_INDEX=true DESTDIR=${pkgdir} install
}
