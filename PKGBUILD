# Maintainer: Albert Briscoe <albertsbriscoe@gmail.com>

pkgname=gr-nrsc5-rx-git
pkgver=r28.49cfa80
pkgrel=1
pkgdesc="GNU Radio module for receiving NRSC-5"
arch=('x86_64')
url="https://github.com/Albert-S-Briscoe/gr-nrsc5-rx"
license=('GPL')
depends=('gnuradio' 'nrsc5')
makedepends=('git' 'cmake')
provides=('gr-nrsc5-rx')
source=("$pkgname::git+https://github.com/Albert-S-Briscoe/gr-nrsc5-rx.git")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	mkdir -p build
	cd build

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_DOXYGEN=false ..
	make
}

package() {
	cd "$pkgname/build"
	make DESTDIR="$pkgdir/" install
}
