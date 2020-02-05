# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=omphalos
pkgver=0.99.10
pkgrel=1
pkgdesc="Network enumeration and domination"
url="https://nick-black.com/dankwiki/index.php/Omphalos"
license=('GPL3')
arch=('x86_64')
depends=('libpciaccess' 'libpcap' 'zlib' 'wireless_tools' 'sysfsutils'
         'notcurses>=1.1.5')
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

sha256sums=('64c508c581364ca14cc43dcba791db82ce14632adf839a595b2efba88bc91d76')
