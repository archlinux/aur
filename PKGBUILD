# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>

pkgname=lattice-diamond
pkgver=3.7
pkgrel=1
pkgdesc="Lattice Diamond design software"
arch=('x86_64')
url="http://www.latticesemi.com/latticediamond"
license=('custom')
options=('!strip')
provides=('lattice-diamond')
conflicts=('lattice-diamond')
source=(http://files.latticesemi.com/Diamond/3.7/diamond_3_7-base_x64-96-1-x86_64-linux.rpm
		synp-plat-check.patch
		lattice-diamond.png
		lattice-diamond.desktop)
md5sums=('162ab905a552a72763aa62dc3efe0ef7'
		 'b03c61ceb13d196d651a6ed26f61c796'
		 'd04fb58bdb5f67e44b5058e14f3aacf9'
		 'fbba8b33146178b861871aabdc779fbd')

prepare() {
	# Extract all the packages
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/bin
	tar -xzf bin.tar.gz
	rm bin.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/cae_library
	tar -xzf cae_library.tar.gz
	rm cae_library.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/data
	tar -xzf data.tar.gz
	rm data.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/embedded_source
	tar -xzf embedded_source.tar.gz
	rm embedded_source.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/examples
	tar -xzf examples.tar.gz
	rm examples.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/ispfpga
	tar -xzf ispfpga.tar.gz
	rm ispfpga.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/synpbase
	tar -xzf synpbase.tar.gz
	rm synpbase.tar.gz
	cd ${srcdir}/usr/local/diamond/${pkgver}_x64/tcltk
	tar -xzf tcltk.tar.gz
	rm tcltk.tar.gz
}

build() {
	# Patch to skip platform check, allowing Synplify Pro to run on non
	# officially supported platforms
	patch -p1 < synp-plat-check.patch
}

package() {
	# Move everything to pkgdir
	mv ${srcdir}/usr ${pkgdir}/
	# Copy .desktop and icon files
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp "${srcdir}/lattice-diamond.png" "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "$srcdir/lattice-diamond.desktop" "$pkgdir/usr/share/applications/"
} 
