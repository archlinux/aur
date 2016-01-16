# Maintainer: Daniel Sandman <revoltism+AUR@gmail.com>

_pkgname=covergloobus
pkgname=covergloobus-dev
pkgver=1.7.3
pkgrel=0
pkgdesc="A standalone application to see what is playing in your favourite music player (this is the development release)"
arch=(any)
url=https://launchpad.net/$pkgname
license=(GPL3)
depends=(dbus-python python2 pygtk python2-xdg ttf-liberation)
makedepends=(intltool gettext)
conflicts=('covergloobus')
source=(http://ppa.launchpad.net/gloobus-dev/covergloobus/ubuntu/pool/main/c/covergloobus/covergloobus_1.7.3.tar.gz)
sha256sums=('cab2ab2831a348a925c8df84266c6a27f9bf52ac2033828b7990f9abf69d024a')

build() {
    cd $_pkgname-$pkgver/
    export PYTHON=python2
    find -type f -exec sed -ri \
        -e 's:python\b:&2:' \
        -e 's:AM_PROG_MKDIR_P:AC_PROG_MKDIR_P:g' '{}' \;
    autoreconf -fi
    ./configure --prefix=/usr --sysconfdir=/etc
    make
}

package() {
    make -C $_pkgname-$pkgver DESTDIR="$pkgdir" install
}

