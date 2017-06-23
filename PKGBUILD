# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: David Manouchehri

pkgname="lattice-diamond"
pkgdesc="Lattice Diamond design software"
url="http://www.latticesemi.com/"
license=('custom')
pkgver=3.9
_revision="99-2"
pkgrel=2
arch=('x86_64')
source=("http://files.latticesemi.com/Diamond/${pkgver}/diamond_${pkgver/"."/"_"}-base_x64-${_revision}-${arch}-linux.rpm"
		"lattice-diamond.png"
		"lattice-diamond.desktop")
sha512sums=('ee4ef401f7e6db6b54061e612224666ee0f3218499653f82b66a2865a0fdf3e6c8986c7a70d6c92da7d1276b6e21081866603d544d6fdc0c60fcccbcfa7b683a'
			'772fa260bb1a4ed7c4e328a99b3cd16b625e8880d7731abbe0cd59dbe4d743265e169a26ceba7b619a87c1cb9638a268a5501d3358863171ee808e59b2d3b0ac'
			'376ff8219222f4cecec686356ccbbd19ee5e721ab991d4ec335a32248431e4a26433d29476cd900fb3dee7e441a875eaacbf2b197273482d7b39bff76c8db70c')
options=('!strip' '!upx')
#PKGEXT=".pkg.tar" # The package is over 3 GB, uncomment this line if you prefer not compressing it

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

package() {
	# Move everything to pkgdir
	mv ${srcdir}/usr ${pkgdir}/
	# Copy .desktop and icon files
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	cp "${srcdir}/lattice-diamond.png" "${pkgdir}/usr/share/pixmaps"
	mkdir -p "${pkgdir}/usr/share/applications"
	cp "$srcdir/lattice-diamond.desktop" "$pkgdir/usr/share/applications/"
} 
