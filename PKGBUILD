# Maintainer: Rose Kunkel <rose at rosekunkel dot me>

pkgname=make-without-guile
_pkgname=make
pkgver=4.3
pkgrel=1
pkgdesc='GNU make utility to maintain groups of programs, without guile dependency'
arch=('x86_64')
url='https://www.gnu.org/software/make'
license=('GPL3')
depends=('glibc')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("https://ftp.gnu.org/gnu/${_pkgname}/${_pkgname}-${pkgver}.tar.lz"{,.sig})
sha256sums=('de1a441c4edf952521db30bfca80baae86a0ff1acd0a00402999344f04c45e82'
            'SKIP')
validpgpkeys=('6D4EEB02AD834703510B117680CB727A20C79BB2') # Paul Smith

build() {
	cd "${_pkgname}-${pkgver}"

 	# Dependency tracking uses make
	./configure --prefix=/usr \
		--without-guile \
		--disable-dependency-tracking
	
	# Bootstrap make
	./build.sh
	./make
}

check() {
	cd "${_pkgname}-${pkgver}"
	./make -k check
}

package() {
	cd "${_pkgname}-${pkgver}"
	./make DESTDIR="${pkgdir}" install
}

