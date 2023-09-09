# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-appfinder
pkgname=${_pkgname}-devel
pkgver=4.19.1
pkgrel=1
pkgdesc="Application finder for Xfce"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://docs.xfce.org/xfce/xfce4-appfinder/start"
license=('GPL2')
groups=('xfce4-devel')
depends=('libxfce4ui' 'garcon' 'xfconf' 'hicolor-icon-theme')
makedepends=('intltool')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
replaces=('xfce-utils')
source=("https://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2")
sha256sums=('d8bd2a1dd9d193eb25e8e5e68b1beae3578a46d1c5eeee30bec7dabbf4330648')

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

