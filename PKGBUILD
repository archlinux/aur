# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Contributor: tee < teeaur at duck dot com >

pkgname=osdlyrics
pkgver=0.5.16
pkgrel=1
pkgdesc="A lyric show compatible with various media players"
arch=('x86_64')
url="https://github.com/osdlyrics/osdlyrics"
license=('GPL-3.0-or-later')
depends=('gtk2' 'dbus-glib' 'curl' 'libnotify' 'libmpd' 'xmms2'
         'glibc' 'hicolor-icon-theme' 'sqlite' 'pango' 'python'
         'python-pycurl' 'python-dbus' 'python-chardet'
         'python-gobject' 'python-mpd2' 'libappindicator')
makedepends=('intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('d9f38f12229b7b96abbe9b99ed464f8c3ad9a2b78439d46f79f70b52e74515d8f3ecdef371fea439981ed45aa499e5f0784edb715c32a0aa43866f5cb508569f')

prepare() {
  cd "$pkgname-$pkgver"

  # -Werror is really quite annoying
  ## automake: warning: possible forward-incompatibility.
  ## automake: At least a source file is in a subdirectory, but the 'subdir-objects'
  ## automake: automake option hasn't been enabled.
  sed -i 's/-Werror//g' configure.ac
  autoreconf -fi
}

build() {
  cd "$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
