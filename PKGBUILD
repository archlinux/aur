# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Trizen <trizenx at gmail dot com>
# Contributor: Federico Cinelli <cinelli.federico@gmail.com>

pkgname=velox
pkgver=0.0.3
pkgrel=2
pkgdesc="A simple xcb window manager inspired by awesome, xmonad, and dwm."
arch=('i686' 'x86_64')
url="http://www.ohloh.net/p/velox-wm"
license=('GPL2')
depends=('xcb-util' 'xcb-util-wm' 'alsa-lib' 'libx11' 'libyaml' 'libmpdclient')
source=("https://github.com/downloads/michaelforney/$pkgname/$pkgname-$pkgver.tar.bz2"
        xcb-atom.patch
        xcb-aux.patch
        build-fixes.patch)
md5sums=('0eda26856cdc9fbc68593b6b360970db'
         'd008e54ee2cc11e69c6d98afed1d5726'
         '37368fc1b753e4ec6d3a2469f701cd8b'
         '0e79b777b060ea412b47b4cf52458bf6')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -i "$srcdir/xcb-atom.patch"
  patch -Np2 -i "$srcdir/xcb-aux.patch"
  patch -Np2 -i "$srcdir/build-fixes.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}

# vim: ft=sh syn=sh et
