# Contributor: Vojtech Horky <AUR / hotspur>
pkgname=msim-git
pkgver=0443c37
pkgrel=1
pkgdesc="Light-weight computer simulator based on MIPS R4000"
url="http://dsrg.mff.cuni.cz/~holub/sw/msim/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('readline')
makedepends=('imake')
provides=('msim')
conflicts=('msim')
source=("$pkgname"::'git://github.com/D-iii-S/msim.git')
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
	msg "Installing documentation"
	install -d -m 0755 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
	install -m 0644 doc/reference.html doc/default.css \
		"${pkgdir}/usr/share/doc/${pkgname}-${pkgver}/"
}
