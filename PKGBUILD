# $Id: PKGBUILD 131533 2015-04-17 08:47:59Z bgyorgy $
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Mark Rosenstand <mark@borkware.net>

pkgname=notification-daemon-git
_pkgname=notification-daemon
pkgver=3.20.0.r1.g34af3da
pkgrel=1
pkgdesc="Notification daemon for the desktop notifications framework"
arch=(i686 x86_64)
license=(GPL)
url="http://www.gnome.org/"
depends=(gtk3 libcanberra)
makedepends=(git autoconf-archive intltool python)
conflicts=($_pkgname)
provides=($_pkgname)
source=(git://git.gnome.org/notification-daemon)
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    ./autogen.sh --prefix=/usr --sysconfdir=/etc \
        --libexecdir=/usr/lib/notification-daemon-1.0 \
        --localstatedir=/var --disable-static --disable-Werror
    make
}

check() {
    cd $_pkgname
    make check
}

package() {
    cd $_pkgname
    make DESTDIR="$pkgdir" install
}
