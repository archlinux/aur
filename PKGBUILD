# Maintainer: Bernard Baeyens (berbae) <berbae52 at sfr dot fr>
pkgname=freetuxtv-svn
pkgver=0.6.8.r0.g66dda27
pkgrel=1
pkgdesc="WebTV vlc player to watch tv/radio playlists on the internet"
arch=('x86_64')
url="https://github.com/freetuxtv/freetuxtv"
license=('GPL3')
depends=('vlc' 'gtk3' 'sqlite' 'curl' 'libnotify' 'dbus-glib')
makedepends=('git' 'intltool')
conflicts=('freetuxtv')

source=('freetuxtv::git+https://github.com/freetuxtv/freetuxtv.git')
md5sums=('SKIP')

pkgver() {
  cd $srcdir/freetuxtv
  _version=$(git describe --long master)
  echo ${_version#freetuxtv-}|sed 's/\([^-]*-g\)/r\1/;s/-/./g'
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
