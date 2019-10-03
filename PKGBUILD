# Maintainer: Kyle Guarco <kyleguarco55@gmail.com>

pkgbase=berry
_pkgname=berry
pkgname=berry-git
_pkgver=caf4f33
pkgver=git+$_pkgver
pkgrel=1
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

	git checkout $_pkgver
	make
}

package() {
	cd ${_pkgname}/
	make DESTDIR="${pkgdir}/" PREFIX="/usr/local" install
	
	mkdir -p "${pkgdir}/etc/xdg/berry"
	install -D -m644 examples/* "${pkgdir}/etc/xdg/berry/"
}

