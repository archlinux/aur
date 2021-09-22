# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-appfinder
pkgname=${_pkgname}-devel
pkgver=4.17.0
pkgrel=1
pkgdesc="An application finder for Xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'libxfce4util>=4.15.2' 'garcon' 'xfconf' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('e111ef4fe6dc6391a3ab482ad92029e9dfd95936c640ec3424ac61079585fa05')

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

