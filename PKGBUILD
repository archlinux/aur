# Maintainer: doragasu <doragasu (yawn) hotmail (roll) com>
# Contributor: David Manouchehri
#
# Note: If downloads do not work (fail with e.g. error 403), you will have
# to manually download the base package and the latest service pack from
# http://www.latticesemi.com/latticediamond#linux
# Then put these files in the build directory and retry.

_version=3.12
_base=240-2
pkgname=lattice-diamond
pkgdesc='Lattice Diamond design software'
url=http://www.latticesemi.com/
license=('custom')
pkgver=${_version}
pkgrel=1
arch=('x86_64')
install=$pkgname.install
source=("http://files.latticesemi.com/Diamond/${_version}/diamond_${_version/"."/"_"}-base-${_base}-${arch}-linux.rpm"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.install")
sha512sums=('b3cd590ad588c01b0296ed055735c7cc3670c37265d7f377abb57ff225eec8b621380cc56025eec6f0836bfef470da2d2c28ea87d03bf0152fe506c16c02f6b9'
            '772fa260bb1a4ed7c4e328a99b3cd16b625e8880d7731abbe0cd59dbe4d743265e169a26ceba7b619a87c1cb9638a268a5501d3358863171ee808e59b2d3b0ac'
            'b5e8b6d6ed282181aff1a0206adf333339c19bd9f2f0d61984864891e971f4923f64d6fc8b657035a080d22c519f26afa30d73933f842b9c66008cecad3f3179'
            '0f6f4463e1b1266a151afaaf6fefb3d69b712fafd6f2fa20beb211a3f9dd4db216be7255cc8fddaac946534754739c13406476fc6474236e7505bcd033a71d81')
options=('!strip')
PKGEXT=".pkg.tar.zst"

prepare() {
    # Extract all the packages from base
    for package in bin cae_library data embedded_source examples ispfpga modeltech synpbase tcltk
    do
        echo -en "\tExtracting ${package}..."
        cd ${srcdir}/usr/local/diamond/${_version}/${package}
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
