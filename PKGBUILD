# Maintainer: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: Andriy Kovtun <kovtunos@yandex.ru>
# Contributor: sausageandeggs <sausageandeggs@archlinux.us>

pkgname=x-tile
pkgver=2.5.1
pkgrel=1
pkgdesc="A gnome/xfce tiling applet for your panel"
arch=(any)
url=http://www.giuspen.com/$pkgname
license=(GPL2)
depends=(hicolor-icon-theme python2-gconf)
install=$pkgname.install
source=(http://www.giuspen.com/software/$pkgname-$pkgver.tar.xz)
sha256sums=('96ec4c6414c94e6e057d50c48556e003a39ad1a645799e08bfe5c1bb83cc27ca')
sha512sums=('b5fab86109ecc8f4feac09bb4f1a8bec5b511a7dbcfeef87923efdfd64b46726d3f7579967673b9d3312f4b03c3471c61ecf50613cfe73b98a6cbe34bdda3774')

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
