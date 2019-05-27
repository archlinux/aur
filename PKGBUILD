# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=garcon
pkgname=${_pkgname}-devel
pkgver=0.6.2
pkgrel=1
pkgdesc="Implementation of the freedesktop.org menu specification"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('LGPL')
groups=('xfce4-devel')
depends=('libxfce4ui')
makedepends=('intltool' 'python')
replaces=('libxfce4menu')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/garcon/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('a87f09648ff10d45c524b3bfe618f18622bdd8b205589d35fed2f12d9c79c47c')

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
