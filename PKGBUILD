# Maintainer: twa022 <twa022 at gmail dot com>

_pkgname=xfwm4
pkgname=${_pkgname}-devel
pkgver=4.11.3
pkgrel=1
pkgdesc="Xfce window manager"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('libxfce4ui>=4.11.0' 'libwnck' 'hicolor-icon-theme')
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
makedepends=('intltool')
options=('!libtool')
install=$_pkgname.install
source=(http://archive.xfce.org/src/xfce/$_pkgname/${pkgver%.*}/$_pkgname-$pkgver.tar.bz2)

build() {
  cd "$srcdir/$_pkgname-$pkgver"

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
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

md5sums=('ed91ae7b1677e77ce537a888414d7ce4')
