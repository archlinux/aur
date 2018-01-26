# Contributor: linuxSEAT <--put_my_name_here--@gmail.com>

pkgname=minbar
pkgver=0.2.1
pkgrel=10
pkgdesc="Islamic prayer times and athan for GNOME"
url="http://djihed.com/minbar"
arch=('i686' 'x86_64')
license=('GPL')
depends=(libitl libgnomecanvas gstreamer0.10 libnotify gconf hicolor-icon-theme
rarian)
makedepends=(gnome-common)
optdepends=('xfce4-xfapplet-plugin: adds Xfce4 panel support')
install=$pkgname.install
source=(http://pkgs.fedoraproject.org/repo/pkgs/minbar/minbar-0.2.1.tar.bz2/dd1543a2e6cc9873d39d60b61dec7508/$pkgname-$pkgver.tar.bz2
        minbar.patch)
md5sums=('dd1543a2e6cc9873d39d60b61dec7508' 
         '7b28640c6797c15bfc31b3a3be8ff27d')

build() {
  cd $srcdir/$pkgname-$pkgver

  LDFLAGS="-lm"
  patch -p1 -i ../minbar.patch || return 1
  ./autogen.sh --prefix=/usr --sysconfdir=/etc
  make || return 1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR=${pkgdir} install
}
