# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=msim-git
pkgver=482a575
pkgrel=1
pkgdesc="Light-weight MIPS R4000 and RISC-V system simulator"
url="https://d3s.mff.cuni.cz/software/msim/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
makedepends=('imake')
provides=('msim')
conflicts=('msim')
source=("$pkgname"::'git+https://github.com/d-iii-s/msim.git')
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    # Use the tag of the last commit
    git describe --always --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${pkgname}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	make "DESTDIR=${pkgdir}" install
}
