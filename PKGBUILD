# Maintainer: 
# Based on freetuxtv-svn by Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
pkgname=freetuxtv-git
pkgver=0.6.8.r45.gc5781e5
pkgrel=1
pkgdesc="WebTV vlc player to watch tv/radio playlists on the internet"
arch=('x86_64')
url="https://github.com/freetuxtv/freetuxtv"
license=('GPL3')
depends=('vlc' 'gtk3' 'curl' 'libnotify' 'dbus-glib')
makedepends=('git' 'intltool')
conflicts=('freetuxtv')
source=('freetuxtv::git+https://github.com/freetuxtv/freetuxtv.git')
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/freetuxtv
  git describe --long | sed 's/^freetuxtv-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd $srcdir/freetuxtv
  NOCONFIGURE=true ./autogen.sh
  ./configure --prefix=/usr --with-gtk=3.0
  make
}

package() {
  cd $srcdir/freetuxtv
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
