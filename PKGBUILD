# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=libxfce4util
pkgname=${_pkgname}-devel
pkgver=4.19.0
pkgrel=1
pkgdesc="Basic utility non-GUI functions for Xfce (development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4util/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('glib2')
makedepends=('gtk-doc' 'gobject-introspection' 'vala')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=(https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('1784bced26fa8bdf5104a56f988e848ac25952032603887dc7b95c64b4d35326')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
