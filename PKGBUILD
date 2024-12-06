
# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfwm4
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=1
pkgdesc="Xfce window manager (development snapshot)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'xfconf' 'libwnck3' 'libepoxy' 'libxpresent' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('89e8066dbc8d20ee2b46a7d79810f9dce20e1ca1ac8d7809a5461d21304a03b5')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-startup-notification \
    --enable-randr \
    --enable-compositor \
    --enable-xsync \
    --enable-xpresent \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}
