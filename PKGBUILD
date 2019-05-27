# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-appfinder
pkgname=${_pkgname}-devel
pkgver=4.13.3
pkgrel=1
pkgdesc="An application finder for Xfce"
arch=('i686' 'x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'garcon' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('d738082a5fb01e42ea6333803012fd80258061f444afbbbd7b05a0f620a32ba6')

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

