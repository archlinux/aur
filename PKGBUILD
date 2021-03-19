# Maintainer: Stephan Friedrichs <accounts at sfriedri dot de>

pkgname='leda-free'
pkgver='6.3'
pkgrel='4'
pkgdesc='C++ class library for efficient data types and algorithms'
url='https://www.algorithmic-solutions.com/index.php/products/leda-free-edition'
license=('custom:LEDA Free License')
arch=('x86_64')
source=("https://www.algorithmic-solutions.info/free/Packages/LEDA-${pkgver}-free-fedora-core-8-64-g++-4.1.2-mt.tar.gz")
sha256sums=('281057aa2077972d46e5a8e42cecb5633fdf7682bc4ff8ca83e31bde6ae06db9')
noextract=(${source[0]})
depends=('gcc-libs' 'tcsh')
options=('staticlibs' '!strip' '!emptydirs')

prepare() {
	# As of version 6.3, the archive is broken and needs to be extracted manually.
	tar -xf "${srcdir}/LEDA-${pkgver}-free-fedora-core-8-64-g++-4.1.2-mt.tar"
}

package() {
	local _ledadir="LEDA-${pkgver}-free-fedora-core-8-64-g++-4.1.2-mt"

	# Static and shared libraries
	install -D -m644 "${srcdir}/${_ledadir}/libleda.a" "${pkgdir}/usr/lib/libleda.a"
	install -D -m644 "${srcdir}/${_ledadir}/libleda.so" "${pkgdir}/usr/lib/libleda.so"

	# Includes
	mkdir -p "${pkgdir}/usr/include/LEDA/"
	for _incldir in "G++" "Kernel" "LEDA"; do
		cp -r "${srcdir}/${_ledadir}/incl/${_incldir}" "${pkgdir}/usr/include/LEDA/"
	done

	# License
	install -D -m644 "${srcdir}/${_ledadir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
}
