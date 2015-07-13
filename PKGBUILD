# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andriy Kovtun <kovtunos@yandex.ru>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=x-tile
pkgver=2.5
pkgrel=3
pkgdesc="A gnome/xfce tiling applet for your panel"
arch=(any)
url=http://www.giuspen.com/$pkgname
license=(GPL2)
depends=(hicolor-icon-theme python2-gconf)
install=$pkgname.install
source=(http://www.giuspen.com/software/$pkgname-$pkgver.tar.xz)
sha256sums=('7fdb1bd143db84538e4024864b53f97f2c7d28eb885f1baee4ce2eb05c262656')
sha512sums=('f0d85cbb34c79e535d1522a3ba4356b555c2db02fbad20026f3ddca9a000ab151ac75d1ee62d9549058190739c5c9f935b47f0998982f0f89877250f08388f30')

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
