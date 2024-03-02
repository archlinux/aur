# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfconf
pkgname=${_pkgname}-devel
pkgver=4.19.2
pkgrel=1
pkgdesc="A simple client-server configuration storage and query system"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfconf/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4util')
makedepends=('gtk-doc' 'vala' 'gobject-introspection')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('0d92e7160e11aaaa78569751f4843b2211896c2664b5f0440c7ccdec626e1ed6')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
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
