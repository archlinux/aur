# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfce4-terminal
pkgname=${_pkgname}-devel
pkgver=0.6.91
pkgrel=1
pkgdesc="A modern terminal emulator primarly for the Xfce desktop environment (Development version)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui' 'vte3' 'hicolor-icon-theme')
makedepends=('intltool')
conflicts=('terminal' "$_pkgname")
provides=("${_pkgname}=${pkgver}")
replaces=('terminal')
source=(http://archive.xfce.org/src/apps/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)
sha256sums=('f5b91b7987c96851860a3b603319a5ef529323424740834b86f62a9db263019c')

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

