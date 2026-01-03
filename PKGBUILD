pkgname=ximaging
pkgver=1.9
pkgrel=1
pkgdesc="Lightweight, Motif-based image viewer for X11"
url="https://fastestcode.org/ximaging.html"
arch=(x86_64)
depends=(
	libjpeg-turbo	# libjpeg
	libpng		# libpng
	libtiff		# libtiff
	libx11		# libX11
	openmotif	# libXm
)
makedepends=(
	make
)
#source=("git+https://github.com/alx210/ximaging")
source=("https://fastestcode.org/dl/ximaging-src-$pkgver.tar.xz")
sha256sums=('1bf62c19156e537b037a9e7f7ff25d2f6d824c5d9a57f9ad06ff55640622e43a')

build() {
	cd $pkgname-src-$pkgver
	make all
}

package() {
	cd $pkgname-src-$pkgver
	# sigh
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/man/man1
	mkdir -p "$pkgdir"/usr/share/X11/app-defaults
	make \
		PREFIX="$pkgdir"/usr \
		APPLRESDIR="$pkgdir"/usr/share/X11/app-defaults \
		install
}
