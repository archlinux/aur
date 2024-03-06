# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=pomodoro-applet
pkgver=1.0
pkgrel=1
pkgdesc='GNOME Panel applet for timing the intervals used in the Pomodoro Techinique(tm)'
arch=('x86_64')
url='https://github.com/stump/pomodoro-applet'
license=('GPL-3.0-or-later')
depends=('cairo' 'glib2' 'glibc' 'gnome-panel' 'gtk3' 'libcanberra' 'libnotify' 'librsvg')
makedepends=('git' 'intltool')
_commit=5bc211e7f5f20e2a335b1a1c7e9e1748a6f846df  # master
source=("git+https://github.com/stump/pomodoro-applet.git#commit=$_commit")
sha256sums=('SKIP')

prepare() {
  cd $pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
