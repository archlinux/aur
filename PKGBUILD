# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Contributor: tee < teeaur at duck dot com >

pkgname=osdlyrics
pkgver=0.6.1
pkgrel=1
pkgdesc="A lyric show compatible with various media players"
arch=('x86_64')
url="https://github.com/osdlyrics/osdlyrics"
license=('GPL-3.0-or-later')
depends=('gtk3' 'dbus-glib' 'curl' 'libnotify' 'libmpd' 'xmms2'
         'glibc' 'hicolor-icon-theme' 'sqlite' 'pango' 'python'
         'python-pycurl' 'python-dbus' 'python-chardet'
         'python-gobject' 'python-mpd2' 'libayatana-appindicator')
makedepends=('intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
b2sums=('03a372a3e99a45f0d9ca6f63583af474575493238835a1f83298d01ff2e1f74b5b14c3a00c4de66a9454dc8bd17a9e12b89e9b675ab24dcaaaed469653a63d7b')

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
