# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname="omphalos"
pkgver="0.99.8"
pkgrel=1
pkgdesc="Network enumeration and domination"
url="https://nick-black.com/dankwiki/index.php/Omphalos"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# Need to add support for explicitly dropping the omphalos-x target. Until then,
# dep on libx11 to eliminate namcap error FIXME.
depends=('libpciaccess' 'libpcap' 'zlib' 'libx11' 'wireless_tools' 'sysfsutils')
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

sha256sums=('f56ac7118facff2005d29507c24cd5253937ec2c7983feae35d72a07eccbfc7b')
