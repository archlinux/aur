# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=omphalos
pkgver=0.99.12
pkgrel=1
pkgdesc="Network enumeration and domination"
url="https://nick-black.com/dankwiki/index.php/Omphalos"
license=('GPL3')
arch=('x86_64')
depends=('libpciaccess' 'libpcap' 'zlib' 'wireless_tools' 'sysfsutils'
         'notcurses>=1.2.2')
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

sha256sums=('90966bd48f0e91c3966189a6ac928b93b2063f69159d346b111d5b92f4447f2c')
