# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: David Manouchehri

pkgname="lattice-diamond"
pkgdesc="Lattice Diamond design software"
url="http://www.latticesemi.com/"
license=('custom')
pkgver=3.10
_revision="111-2"
pkgrel=2
arch=('x86_64')
install="${pkgname}.install"
source=("http://files.latticesemi.com/Diamond/${pkgver}/diamond_${pkgver/"."/"_"}-base_x64-${_revision}-${arch}-linux.rpm"
		"${pkgname}.png"
		"${pkgname}.desktop"
        "${pkgname}.install")
sha512sums=('423f4df79c3f07a7cf9cfd17914019f3c06187c4c1a04f13d48e255d3f75dfea2e1e9641506da59c06e276bef46737c14f502df668a3a7ac6ebe63a3cdd4cd1d'
			'772fa260bb1a4ed7c4e328a99b3cd16b625e8880d7731abbe0cd59dbe4d743265e169a26ceba7b619a87c1cb9638a268a5501d3358863171ee808e59b2d3b0ac'
			'b5365ac137c6114bdd3e1d6bd1f9e2f8f5306cbf763d457190567c0f8d3086bf3dde11f50a22d35e759b62860f0014c66d631d463fd369d09162905fd5732c07'
            'e9b7613fe4cd42085515bccd0bcbf96b0a6185e2c4b1daa1609f888b9e71cca806bb74aca300bfb8c5cd8ef305c34e070e67d4d2bb9ee85e5a7b5f1cffcdb048')
options=('!strip')
#PKGEXT=".pkg.tar" # The package is over 3 GB, uncomment this line if you prefer not compressing it

prepare() {
	# Extract all the packages
    for package in bin cae_library data embedded_source examples ispfpga synpbase tcltk
    do
        echo -n Extracting ${package}... 
        cd ${srcdir}/usr/local/diamond/${pkgver}_x64/${package}
        tar -xzf ${package}.tar.gz
        rm ${package}.tar.gz
        echo ' done!'
    done
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
