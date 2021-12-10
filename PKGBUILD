# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-terminal
pkgname=${_pkgname}-devel
pkgver=0.9.1
pkgrel=1
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment (Development version)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui>=4.17.2' 'vte3' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('terminal' "$_pkgname")
provides=("${_pkgname}=${pkgver}")
replaces=('terminal')
source=(http://archive.xfce.org/src/apps/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('8746cf1435f6da7f508b0af126d21133ccb69ca0b623339df5559bc5f8177db2')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

