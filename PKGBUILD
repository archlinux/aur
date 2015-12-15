# Maintainer: Yunhui Fu <yhfudev@gmail.com>
pkgname=highmoon
pkgver=1.2.4
pkgrel=1
pkgdesc="HighMoon is an 'Artillery' or 'Worms' like Game - which takes place in the universe"
url="http://highmoon.gerdsmeier.net/"
depends=(x-server sdl sdl_mixer sdl_gfx)
install=
source=(http://highmoon.gerdsmeier.net/${pkgname}-${pkgver}.tar.gz)
md5sums=('4b16a749f844d5ca691c9774884979ec')

build() {
    #cd ${srcdir}/${pkgname}-${pkgver}
    cd ${srcdir}/HighMoon
    make || return 1
    chmod 644 gfx/* snd/* 
}

package() {
    #cd ${srcdir}/${pkgname}-${pkgver}
    cd ${srcdir}/HighMoon

    mkdir -p ${pkgdir}/opt/highmoon
    mkdir -p ${pkgdir}/usr/bin
    make INSTALLPATH=${pkgdir}/opt/highmoon INSTALLBIN=${pkgdir}/usr/bin install

    echo 'cd /opt/highmoon/ && ./ufo $1' > ${pkgdir}/usr/bin/highmoon
    chmod +x ${pkgdir}/usr/bin/highmoon
}

