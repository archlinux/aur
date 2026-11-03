# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>
# Contributor: tee < teeaur at duck dot com >

pkgname=osdlyrics
pkgver=0.6.0
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
b2sums=('9b3e826578ec2964e0f6118224d1328ec26b026bdd0efde5c992e1e9d0657007dcc3ca6bcf6bcf872e0d3b4211d6417323765973f268d369ab27a0d7c2afeee6')

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
