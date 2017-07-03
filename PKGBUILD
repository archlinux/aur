# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=pnmixer-git
pkgver=0.7.2.r7.gf1c050d
pkgrel=1
pkgdesc="GTK volume mixer applet that runs in the system tray."
arch=('i686' 'x86_64')
license=('GPL')
url="https://github.com/nicklan/pnmixer"
provides=('pnmixer')
conflicts=('pnmixer')
makedepends=('intltool' 'git' 'cmake')
depends=('gtk2' 'alsa-lib' 'libnotify')
source=("$pkgname::git+https://github.com/nicklan/pnmixer.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd $pkgname
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SKIP_RPATH=ON \
    -DWITH_GTK3=OFF
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
