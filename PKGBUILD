# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libxfce4ui
pkgname=${_pkgname}-devel
pkgver=4.13.2
pkgrel=1
pkgdesc="Commonly used Xfce widgets among Xfce applications"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
depends=('libxfce4util' 'gtk2' 'xfconf' 'libsm' 'startup-notification'
         'hicolor-icon-theme' 'gtk3')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
#replaces=('libxfcegui4') - later when all is ported
options=('!libtool')
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \
    --with-vendor-info='Arch Linux'
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

sha256sums=('8d881273e6be286f0c6c6f1aa1df2dbd3d92114b2e7fbe02979043fc80d8f4f1')
