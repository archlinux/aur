# Maintainer: Patrick Kurth <p.kurth@posteo.de>
pkgname=xschem
pkgver=r523.ac99227
pkgrel=1
pkgdesc="Schematic editor VLSI/ASIC/analog custom designs"
arch=('any')
url="http://github.com/StefanSchippers/xschem"
source=("git+https://github.com/StefanSchippers/xschem.git")
sha256sums=('SKIP')
depends=('libx11' 'libxrender' 'libxcb' 'cairo' 'tcl' 'tk' 'libxpm' 'gawk')
makedepends=('flex' 'bison' 'git')
license=('GPL')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    ./configure --prefix=/usr
    make
}

package() {
	cd "${srcdir}/${pkgname}"
    make DESTDIR="$pkgdir/" install
}
