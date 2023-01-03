# Maintainer:  twa022 <twa022 at gmail dot com>

_pkgname=libxfce4windowing
pkgname=${_pkgname}-devel
pkgver=4.19.0
pkgrel=1
pkgdesc="Windowing concept abstraction library for X11 and Wayland (Development version)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/libxfce4windowing/start"
license=('LGPL2.1')
groups=('xfce4-devel')
depends=('gtk3' 'libwnck3')
makedepends=('intltool' 'gtk-doc' 'gobject-introspection')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('576eacfd2cfde754ac6ffe7d4bd0e0509b78896e5bbd4f6b92a834c8b65f2def')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gtk-doc \
    --disable-debug \

  make
}

package() {
  cd "${_pkgname}-${pkgver}"

  make DESTDIR="$pkgdir" install
}
