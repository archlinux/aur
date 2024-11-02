# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-appfinder
pkgname=${_pkgname}-devel
pkgver=4.19.3
pkgrel=1
pkgdesc="Application finder for Xfce (development release)"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-appfinder/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'garcon' 'xfconf' 'hicolor-icon-theme')
rovides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('9ea2c1c2e5630d0670c9cd47793144ee63c04a63b8b68f0397432e043cd62d27')

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
  make DESTDIR="$pkgdir" install
}

