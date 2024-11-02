# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=exo
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=1
pkgdesc='Extensions to Xfce (Development version)'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://docs.xfce.org/xfce/exo/start'
license=('GPL2' 'LGPL')
groups=('xfce4-devel')
depends=('libxfce4ui' 'libxfce4util' 'hicolor-icon-theme')
makedepends=('gtk-doc')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
source=("https://archive.xfce.org/src/xfce/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.bz2")
sha256sums=('4c3721d47126b1a3143f00a4e4dff5eea364c02c3fa141b09c0b1af16b1f0794')

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
