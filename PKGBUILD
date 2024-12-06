# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=garcon
pkgname=${_pkgname}-devel
pkgver=4.19.3
pkgrel=1
pkgdesc="Implementation of the freedesktop.org menu specification"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/tumbler/start"
license=('LGPL')
groups=('xfce4-devel')
depends=('libxfce4ui')
makedepends=('python' 'gobject-introspection')
replaces=('libxfce4menu')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/garcon/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('21e3f6abcd2ee20aa8bbe8f2e3fa7abc553c45a2df9dddb45a7188ff35aeb528')

build() {
  cd "${_pkgname}-${pkgver}"

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
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
