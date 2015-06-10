# Maintainer: Gavin Lloyd <gavinhungry@gmail.com>

_pkgname=xfce4-power-manager
pkgname=$_pkgname-1.2
pkgver=1.2.0
pkgrel=1
pkgdesc="Power manager for Xfce desktop (1.2.x)"
arch=('i686' 'x86_64')
url="http://www.xfce.org/"
license=('GPL2')
groups=('xfce4')
depends=('xfce4-panel' 'upower' 'libnotify' 'hicolor-icon-theme')
makedepends=('intltool')
install=$pkgname.install
source=(http://archive.xfce.org/src/apps/$_pkgname/1.2/$_pkgname-$pkgver.tar.bz2)
md5sums=('935599b7114b0a4b0e2c9a5d6c72524c')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --sbindir=/usr/bin \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-network-manager \
    --enable-polkit \
    --disable-debug

make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
