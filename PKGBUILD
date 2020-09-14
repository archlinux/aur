# Maintainer: Bhusan Gupta <bhusan.gupta@gmail.com>
pkgname=arp-scan-git
pkgver=r304.af905ce
pkgrel=1
pkgdesc="The ARP Scanner"
arch=(i686 x86_64)
url="https://github.com/royhills/arp-scan"
license=('GPL')
depends=(libpcap)
makedepends=(git)
checkdepends=()
optdepends=('perl: scripting support')
source=(git+https://github.com/royhills/arp-scan)
sha256sums=('SKIP')

pkgver() {
  cd arp-scan
  echo r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd arp-scan
	autoreconf --install
	./configure --prefix=/usr
	make
}

check() {
	cd arp-scan
	make -k check
}

package() {
	cd arp-scan
	make install DESTDIR="$pkgdir"
}
