# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=exo
pkgname=${_pkgname}-devel
pkgver=4.19.0
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
sha256sums=('a0124108c197efcc576a6deeface381416dc7137b6a7e7dfa3060fad62509fb7')

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
