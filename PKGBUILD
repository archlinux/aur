# Maintainer: Alexey Galakhov <agalakhov@gmail.com>
# Contributor: Raedwulf

pkgname=lemon
pkgrel=1
pkgver=1.0.20200809
pkgdesc="The LALR Parser Generator used in sqlite."
arch=('i686' 'x86_64' 'armv7h')
url="http://www.hwaci.com/sw/lemon/"
license=('custom')
depends=('glibc')

source=( 'lemon.c::https://www.sqlite.org/src/raw/tool/lemon.c?name=600a58b9d1b8ec5419373982428e927ca208826edacb91ca42ab94514d006039'
         'lempar.c::https://www.sqlite.org/src/raw/tool/lempar.c?name=e8899b28488f060d0ff931539ea6311b16b22dce068c086c788a06d5e8d01ab7'
         lemon_share.diff license.txt )
sha256sums=('049d9283c4a71c7cd57cf528cd7d4c079f6987343ca2b16b08c0f735ec4ae0be'
            'f58c38f5f4f6c40d24cc9fbf378685b2444d704fca502b03622e7bc0b10ead63'
            '6d09900e476262287c137e990db48283c37ab747df0d562eb4e486b490ea9e61'
            '6b5ff92682dfbdfef6b66f7ab7a6455c081b0260f6e6d3a6669bf99ffb5333e6')

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

