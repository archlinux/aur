# Maintainer: aminb <me@aminb.org>
# Contributor: Steven Honeyman <stevenhoneyman at gmail com>

pkgname=pnmixer-git
pkgver=20150705
pkgrel=1
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
  git log -1 --format="%cd" --date=short | sed 's|-||g'
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
