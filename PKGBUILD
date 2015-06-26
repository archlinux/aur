# Maintainer: Alexey Galakhov <agalakhov@gmail.com>
# Contributor: Raedwulf

pkgname=lemon
pkgrel=4
pkgver=1.69
pkgdesc="The LALR Parser Generator used in sqlite."
arch=('i686' 'x86_64')
url="http://www.hwaci.com/sw/lemon/"
license=('custom')
depends=('glibc')
source=( 'lemon.c::http://www.sqlite.org/src/raw/tool/lemon.c?name=680980c7935bfa1edec20c804c9e5ba4b1dd96f5'
         'lempar.c::http://www.sqlite.org/src/raw/tool/lempar.c?name=01ca97f87610d1dac6d8cd96ab109ab1130e76dc'
         lemon_share.diff license.txt )

prepare() {
	mkdir -p ${srcdir}/build
	cd ${srcdir}/build
	cp ${srcdir}/lemon.c ${srcdir}/lempar.c .
	patch -Np0 -i ${srcdir}/lemon_share.diff
}

build() {
	cd ${srcdir}/build
	make lemon
}

package() {
	cd ${srcdir}/build
	install -Dm755 lemon ${pkgdir}/usr/bin/lemon
	install -Dm644 lempar.c ${pkgdir}/usr/share/lemon/lempar.c
	install -Dm644 ${srcdir}/license.txt ${pkgdir}/usr/share/licenses/lemon/license.txt
}

sha256sums=('5dce8ffd620c9d6daca2c4718da5c8d436542dcf68b05b4b8f30c9f3a198b7b0'
            '71f0880d170e600435b9f705dc5f4ac3bd8d7b23d009ae82664226e88d1a41ad'
            '6d09900e476262287c137e990db48283c37ab747df0d562eb4e486b490ea9e61'
            '6b5ff92682dfbdfef6b66f7ab7a6455c081b0260f6e6d3a6669bf99ffb5333e6')

