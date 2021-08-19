# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Auguste Pop <auguste [at] gmail [dot] com>

pkgname=osdlyrics
pkgver=0.5.9
pkgrel=1
pkgdesc="A lyric show compatible with various media players"
arch=('x86_64')
url="https://github.com/osdlyrics/osdlyrics"
license=('GPL3')
depends=('gtk2' 'dbus-glib' 'curl' 'libnotify' 'libmpd' 'xmms2'
         'desktop-file-utils' 'hicolor-icon-theme' 'sqlite' 'python')
makedepends=('intltool')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('5eda1cb0a5e975ec7d7b2640ce15cdd5d98b47f8467ad0be186073483dabe796')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # -Werror is really quite annoying
  ## automake: warning: possible forward-incompatibility.
  ## automake: At least a source file is in a subdirectory, but the 'subdir-objects'
  ## automake: automake option hasn't been enabled.
  sed -i 's/-Werror//g' configure.ac
  autoreconf -fi
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
