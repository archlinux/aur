# Maintainer: Thomas Weißschuh <thomas t-8ch.de>
# Contributor: Zveroy <zy at aafg dot ws>
# Contributor: Jonas Haag <jonas at lophus dot org>
# Contributor: Pardi Tommaso <homer.j.simson.bis at gmail dot com>

pkgname=evilvte
pkgver='0.5.2~pre1'
pkgrel=2
pkgdesc='VTE based, highly customizable terminal emulator'
arch=('i686' 'x86_64')
provides=('evilvte')
url='http://www.calno.com/evilvte/'
license=('GPL2')
depends=('vte' 'hicolor-icon-theme')
makedepends=('pkg-config')
source=("http://www.calno.com/evilvte/evilvte-${pkgver}.tar.xz")
sha1sums=('fb36a51e5492dbec09e0fea89a115e71a3c58448')
install=evilvte.install

build(){
    cd ${srcdir}/evilvte-${pkgver}

    if [ -e ${startdir}/config.h ]
    then
        echo config.h found.
    else
        cp ./src/config.h ${startdir}/

        echo Please edit ${startdir}/config.h to customize your options.

        if [ -n "${EDITOR}" ] ; then
            "${EDITOR}" "${startdir}/config.h"
        fi
    fi

    cp -f ${startdir}/config.h ./src/
    ./configure --prefix=/usr  --with-gtk=2.0
    make
}

package(){
    cd ${srcdir}/evilvte-${pkgver}
    make DESTDIR=${pkgdir} install
}
