# Maintainer: Alexander Rødseth <rodseth@gmail.com>
pkgname=gdlmm
pkgver=3.3.2
pkgrel=3
pkgdesc="C++ bindings for the gdl library"
arch=('x86_64' 'i686')
url="http://git.gnome.org/browse/gdlmm/"
depends=('gdl' 'gtkmm3')
options=(!libtool !emptydirs)
license=('LGPL')
source=("http://ftp.gnome.org/pub/GNOME/sources/gdlmm/3.3/$pkgname-$pkgver.tar.xz"
        "0001-Don-t-wrap-gdl_dock_layout_get_layouts_ui.patch")
sha256sums=('cf3253be052737332b2b6e9dbd6f62d79cbc3f3398497158c0099dbc45741a46'
            '8fb0d920c5c3d4279738f048cbff65b5b4fa544c9f004f8e64d39e54f52653d5')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # Fix build with gdl 3.6
  patch -Np1 -i "$srcdir/0001-Don-t-wrap-gdl_dock_layout_get_layouts_ui.patch"

  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
