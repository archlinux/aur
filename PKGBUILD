# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=exo
pkgname=${_pkgname}-devel
pkgver=4.21.0
pkgrel=1
pkgdesc='Deprecated extensions to Xfce (Development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://docs.xfce.org/xfce/exo/start'
license=('GPL2' 'LGPL')
groups=('xfce4-devel')
depends=('libxfce4ui' 'libxfce4util' 'hicolor-icon-theme')
makedepends=('gtk-doc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('26f85ca2db3bcf99d8b8af28b0d565b0186ccc3d2ed4a5ba315f6a589b8bc2c9')

build() {
  cd "${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --enable-gtk-doc \
    --disable-debug
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
