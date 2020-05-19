# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=clsync
pkgver=0.4.4
pkgrel=1
pkgdesc="File live sync daemon based on inotify/kqueue/bsm (Linux, FreeBSD), written in GNU C"
arch=('x86_64')
url='http://ut.mephi.ru/oss/clsync'
license=('GPL3')
makedepends=('doxygen'
						 'graphviz'
						 'libcap'
				 		 'libcgroup'
				     'mhash')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/clsync/clsync/archive/v${pkgver}.tar.gz")
sha256sums=('8553b67b0bb902b5ff05a50195c5b0102a522b771f4ff8bec7495d9406514622')

build() {
	cd "${pkgname}-${pkgver}"
	autoreconf -i
	./configure --prefix=/usr \
							--with-libcgroup=yes \
							--with-inotify=yes \
							--with-mhash=yes 
	make -j$(nproc)
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install
}