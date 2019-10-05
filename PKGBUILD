# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

pkgbase=berry
_pkgname=berry
pkgname=berry-git
_pkgver=caf4f33
pkgver=git+$_pkgver
pkgrel=2
pkgdesc="A healthy, bite-sized window manager written over the XLib Library"
url="https://github.com/JLErvin/berry"
arch=('x86_64')
license=('MIT')
makedepends=('gcc')
depends=('libx11')
source=(
	"git://github.com/JLErvin/berry.git"
	berry.desktop
)
sha256sums=('SKIP' 'SKIP')

build() {
	cd ${_pkgname}/

	# Change to the _pkgver (Last updated commit)
	git checkout $_pkgver
	# Compile the window manager
	make
}

package() {
	cd ${_pkgname}/

	# The installation location (from /)
	PFIX="/usr/local"
	# Make the directory if it doesn't exist, then install
	mkdir -p "${pkgdir}/${PFIX}"
	make DESTDIR="${pkgdir}/" PREFIX=$PFIX install
	
	# Install the examples (sample configuration files)
	mkdir -p "${pkgdir}/etc/xdg/berry"
	install -D -m644 examples/* "${pkgdir}/etc/xdg/berry/"
}

