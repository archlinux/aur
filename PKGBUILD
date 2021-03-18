# Maintainer: Carson Rueter <roachh at proton mail dot com>

pkgname=emptty-openrc
pkgver=20210312
pkgrel=1
pkgdesc="OpenRC emptty init script"
arch=('any')
url="https://github.com/tvrzna/emptty"
license=('MIT')
provides=('emptty-openrc')
source=("emptty.initd")
depends=('emptty')
sha256sums=('05ab1fd1fc81d27a07240fe942e2724351314afb4b9a0ee594c0f38cad6cdfac')

pkgver() {
    date +%Y%m%d
}

_inst_initd(){
    install -Dm755 ${srcdir}/$1.initd ${pkgdir}/etc/init.d/$1

    sed -e 's|#!/sbin/openrc-run|#!/usr/bin/openrc-run|g' \
        -e 's|/var/run|/run|g' \
        -e 's|/usr/sbin|/usr/bin|g' \
        -i ${pkgdir}/etc/init.d/$1
}

package(){
    _inst_initd 'emptty'
}
