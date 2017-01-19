# Maintainer: Sven Kadak <sven.kadak [symbol-used-in-emails] g m a i l [D0T] c o m>

pkgname=clutter-gtkmm
pkgver=1.6.0
pkgrel=1
pkgdesc='C++ wrapper for clutter-gtk, allowing you to use cluttermm with gtkmm windows and widgets'
arch=('i686' 'x86_64')
url='https://developer.gnome.org/clutter-gtkmm/'
license=('LGPL2.1')
depends=('clutter-gtk' 'cluttermm' 'gtkmm3')
makedepends=('mm-common' 'git')
_commit=da62b18e98d6ec1c7a00f5be92e21315014516f8
source=(https://github.com/GNOME/clutter-gtkmm/archive/$_commit.tar.gz)
sha256sums=('cb647c02d70b76769b9b352c1262cc4f81520348ab7d4413fc5df99dc2674798')

prepare() {
    cd $pkgname-$_commit
    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd $pkgname-$_commit
    ./configure \
        --prefix=/usr \
        --enable-maintainer-mode \
        --disable-documentation
    make
}

package() {
    cd $pkgname-$_commit
    make DESTDIR=$pkgdir install
}
