# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andriy Kovtun <kovtunos@yandex.ru>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=x-tile
pkgver=2.6
pkgrel=1
pkgdesc="A gnome/xfce tiling applet for your panel"
arch=(any)
url=http://www.giuspen.com/$pkgname
license=(GPL2)
depends=(hicolor-icon-theme python2-gconf)
source=(http://www.giuspen.com/software/$pkgname-$pkgver.tar.xz)
sha256sums=('463fc2f99e36c97529a48a9397a4a240004d9990aac1785198f3f9c2d16952f8')
sha512sums=('5404b7d716956e2239471d803ac9fd536fdde5b2971cdc66158a3ac2982145373e44b3a9d2d769705628a1818ae402e74bfa96ed52d47da2d3929f3a706e83d1')

prepare() {
    cd $pkgname-$pkgver/
    for i in $(find -name '*.py') $pkgname; do
        sed -i 's:^#!/usr/bin/env python$:&2:' "$i"
    done
}

build() {
    cd $pkgname-$pkgver/
    python2 setup.py build
}

package() {
    cd $pkgname-$pkgver/
    python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
