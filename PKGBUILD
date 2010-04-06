# Contributor: Rainy <rainylau(at)gmail(dot)com>
# Contributor: Lee.maRS<leemars at gmail.com>
# Maintainer: Daniel J Griffiths <ghost1227@archlinux.us>

pkgname=ibus-pinyin
pkgver=1.3.1
pkgrel=1
pkgdesc="The PinYin Engine for IBus Input Framework"
arch=('i686' 'x86_64')
license=('LGPL')
url="http://ibus.googlecode.com"
depends=('ibus' 'libsigc++2.0')
makedepends=('intltool')
provides=('ibus-pinyin=1.2.0')
install=ibus-pinyin.install
source=(http://ibus.googlecode.com/files/${pkgname}-${pkgver}.tar.gz
        http://ibus.googlecode.com/files/pinyin-database-1.3.0.tar.bz2)
md5sums=('7e221ea3b5cad6cd2fe48a08ebd95de3'
         'd41d8cd98f00b204e9800998ecf8427e')

build() {
	ln -sf ${srcdir}/pinyin-database-1.3.0.tar.bz2 \
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
