# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=garcon
pkgname=${_pkgname}-devel
pkgver=4.17.2
pkgrel=1
pkgdesc="Implementation of the freedesktop.org menu specification"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('LGPL')
groups=('xfce4-devel')
depends=('libxfce4ui')
makedepends=('intltool' 'python' 'gobject-introspection')
replaces=('libxfce4menu')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/garcon/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('83338cf9e6feed663c6ec5e723f75e45909748f81225812caaa66d4c1f8ad139')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
