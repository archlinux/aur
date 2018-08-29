# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

_pkgname=berry-master
pkgname=berry-git
pkgbase=berry
pkgver=devel
pkgrel=1
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc')
depends=('libx11')
source=("https://github.com/JLErvin/berry/archive/master.zip")
sha256sums=('SKIP')

prepare() {
	patch -p1 -i ../manual.patch
	
	# Installing the desktop file doesn't work, so N/A for now.
	#install -D -m644 ../berry.desktop "${pkgdir}/usr/share/xsessions/"
}

build() {
	# Build the package.
	cd ${_pkgname}/
	make
}

package() {
	# ...and install.
	cd ${_pkgname}/
	make DESTDIR="$pkgdir/" install
	
	cd man/
	make DESTDIR="$pkgdir/" install
}
