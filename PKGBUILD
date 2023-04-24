# Maintainer: Malacology <guoyizhang at malacology dot net>
# Contributor: Malacology <guoyizhang at malacology dot net>

pkgbase=tnt-bio
pkgname=('tnt-bio' 
	'tnt-mpi'
	'tnt-gui'
	'tnt-extra')
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
	cd $srcdir/TNT-Docs_n_Datasets
	chmod a+r $srcdir/TNT-Docs_n_Datasets -R
	unzip tnt_scripts.zip -d ./tnt_scripts
}
package_tnt-bio () {
  depends=('ncurses5-compat-libs' 'glibc')
	cd ${srcdir}/TNT-bin
	chmod +x tnt
	install -Dm 755 tnt ${pkgdir}/usr/bin/tnt
}
package_tnt-mpi () {
  depends=('ncurses5-compat-libs' 'pvm' 'openmpi' 'glibc')
	cd ${srcdir}/TNT-bin
	chmod +x mpitnt
	install -Dm 755 mpitnt ${pkgdir}/usr/bin/mpitnt
}
package_tnt-gui () {
  depends=('ncurses5-compat-libs' 'gtk3' 'glibc')
  optdepends=('pvm')
	cd ${srcdir}/TNT-bin
	chmod +x gTNT
	install -Dm 755 gTNT ${pkgdir}/usr/bin/gTNT
}
package_tnt-extra () {
	install -dm755 $pkgdir/usr/share/tnt/

	cd $srcdir/
	# PDF
	install -Dm 755 README_FIRST.pdf $pkgdir/usr/share/tnt/

	cd $srcdir/TNT-Docs_n_Datasets
	# script
	mv $srcdir/TNT-Docs_n_Datasets/tnt_scripts $pkgdir/usr/share/tnt/
	# font
	install -Dm 755 Tred.ttf ${pkgdir}/usr/share/fonts/Tred/Tred.ttf
	# html
	mv $srcdir/TNT-Docs_n_Datasets/*.htm $pkgdir/usr/share/tnt/
}
