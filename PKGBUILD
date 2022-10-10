# Maintainer: Malacology <guoyizhang at malacology dot com>
# Contributor: Malacology <guoyizhang at malacology dot com>

pkgbase=tnt-bin
pkgname=('tnt-bin' 'tnt-mpi' 'tnt-gui-bin' 'tnt-extra')
pkgver=1.6
pkgrel=1
pkgdesc="Tree analysis using New Technology. https://doi.org/10.1111/cla.12160"
arch=('x86_64')
url="http://www.lillo.org.ar/phylogeny/tnt/"
license=('custom')
makedepends=('unzip')
depends=('tnt-ncurses5-compat-libs')
source=("http://www.lillo.org.ar/phylogeny/tnt/tnt-linux.zip")
sha256sums=('SKIP')
prepare () {
	cd $srcdir/Docs_and_Datasets
	unzip tnt_scripts.zip -d ./tnt_scripts
}
package_tnt-bin () {
  depends=('tnt-ncurses5-compat-libs' 'glibc')
	cd ${srcdir}/binaries
	chmod +x tnt
	install -Dm 755 tnt ${pkgdir}/usr/bin/tnt
}
package_tnt-mpi () {
  depends=('tnt-ncurses5-compat-libs' 'pvm' 'openmpi' 'glibc')
	cd ${srcdir}/binaries
	chmod +x mpitnt
	install -Dm 755 mpitnt ${pkgdir}/usr/bin/mpitnt
}
package_tnt-gui-bin () {
  depends=('tnt-ncurses5-compat-libs' 'gtk3' 'glibc')
  optdepends=('pvm')
	cd ${srcdir}/binaries
	chmod +x gTNT
	install -Dm 755 gTNT ${pkgdir}/usr/bin/gTNT
}
package_tnt-extra () {
	install -dm755 $pkgdir/usr/share/tnt/
	
	cd $srcdir/
	# PDF
	install -Dm 755 README_FIRST.pdf $pkgdir/usr/share/tnt/

	cd $srcdir/Docs_and_Datasets
	# script
	mv $srcdir/Docs_and_Datasets/tnt_scripts $pkgdir/usr/share/tnt/
	# font
	install -Dm 755 Tred.ttf ${pkgdir}/usr/share/fonts/Tred/Tred.ttf
	# html
	mv $srcdir/Docs_and_Datasets/*.htm $pkgdir/usr/share/tnt/
}
