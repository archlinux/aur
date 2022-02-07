# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=libimobiledevice-glue-git
pkgver=r24.90fc383
pkgrel=1
pkgdesc='Library with common code used by the libraries and tools around the libimobiledevice project'
url='http://www.libimobiledevice.org/'
arch=(x86_64)
license=('LGPL2.1')
depends=('libplist')
makedepends=('git')
provides=('libimobiledevice-glue')
source=("git+https://github.com/libimobiledevice/libimobiledevice-glue")
sha256sums=('SKIP')

pkgver() {
	cd libimobiledevice-glue
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd libimobiledevice-glue
	NOCONFIGURE=1 ./autogen.sh
}

build() {
	cd libimobiledevice-glue
	./configure --prefix=/usr
	make
}

package() {
	cd libimobiledevice-glue
	make DESTDIR="$pkgdir" install
}
