# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=garcon
pkgname=${_pkgname}-devel
pkgver=0.7.2
pkgrel=1
pkgdesc="Implementation of the freedesktop.org menu specification"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('LGPL')
groups=('xfce4-devel')
depends=('libxfce4ui>=4.15.2' 'libxfce4util>=4.15.2')
makedepends=('intltool' 'python' 'gobject-introspection')
replaces=('libxfce4menu')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/garcon/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('bcb437a74dcb9f5af73a80f2b019c446f92429c93e2e2120de67e6ad3dac94b3')

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
