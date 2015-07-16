# Maintainer: aminb <me@aminb.org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=pnmixer-git
pkgver=0.5.r116.gd7c3ea0
pkgrel=1
epoch=1
pkgdesc="Lightweight GTK3 volume control program that runs in the system tray"
url="https://github.com/nicklan/pnmixer"
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3' 'alsa-lib' 'libx11' 'libnotify')
provides=('pnmixer')
conflicts=('pnmixer')
makedepends=('intltool')
source=("git://github.com/nicklan/pnmixer.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/pnmixer"
  git describe --tags --long|sed -r 's,^[^0-9]*,,;s,([^-]*-g),r\1,;s,[-_],.,g'
}

build() {
  cd "$srcdir/pnmixer"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc 
  make
}

package() {
  cd "$srcdir/pnmixer"
  make DESTDIR="$pkgdir" install
}
