# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=omphalos
pkgver=0.99.9
pkgrel=1
pkgdesc="Network enumeration and domination"
url="https://nick-black.com/dankwiki/index.php/Omphalos"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# Need to add support for explicitly dropping the omphalos-x target. Until then,
# dep on libx11 to eliminate namcap error FIXME.
depends=('libpciaccess' 'libpcap' 'zlib' 'libx11' 'wireless_tools' 'sysfsutils'
         'outcurses>=0.0.8')
makedepends=('docbook-xsl' 'autoconf-archive' 'libxslt' 'autoconf')
source=("https://github.com/dankamongmen/omphalos/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fis
  ./configure --prefix=/usr --with-ncurses
  make
}

check() {
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -m 0644 -D -t "$pkgdir/usr/share/omphalos" usb.ids ieee-oui.txt
}

sha256sums=('e4f0e952c2c1b68389a53d69efa6e90031a8de4a4afd762a00bfcbfac243b5db')
