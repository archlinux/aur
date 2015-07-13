# Maintainer:  Martin C. Doege <mdoege at compuserve dot com>
# Contributor: Anntoin Wilkinson <anntoin@gmail.com>

pkgname=fsv2
pkgver=0.9.1
pkgrel=1
epoch=1
pkgdesc="GTK2 port of fsv, the filesystem visualizer"
arch=('i686' 'x86_64')
url="https://github.com/mcuelenaere/fsv"
license=('LGPL')
depends=('gtkglarea' 'gtkmm' 'ftgl' 'gtk2')
makedepends=('autoconf' 'automake' 'libtool')
options=('!libtool')
source=("https://github.com/mcuelenaere/fsv/archive/fsv-0.9-1.tar.gz"
        "fsv2.desktop")
md5sums=('61e8d3ce2803d8873a717d20d22fbc6d'
         '0284ef25cd9fd798d5e863fc65485d6c')

build() {
  cd "$srcdir/fsv-fsv-0.9-1"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/fsv-fsv-0.9-1"
  make DESTDIR="$pkgdir/" install
  mv $pkgdir/usr/bin/fsv $pkgdir/usr/bin/fsv2
  install -Dm 644 src/xmaps/fsv-icon.xpm $pkgdir/usr/share/pixmaps/fsv2.xpm
  install -Dm 644 $srcdir/fsv2.desktop $pkgdir/usr/share/applications/fsv2.desktop
}

# vim:set ts=2 sw=2 et:
