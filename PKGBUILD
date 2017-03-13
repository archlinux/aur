# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=ctffind3-ctftilt
pkgver=20140609
pkgrel=1
pkgdesc="Determine local defocus and specimen tilt of electron micrographs"
arch=(x86_64)
url="http://grigoriefflab.janelia.org/ctf"
license=('GPL')
depends=('gcc-fortran')
source=("http://grigoriefflab.janelia.org/sites/all/modules/pubdnldcnt/pubdnldcnt.php?file=http://grigoriefflab.janelia.org/sites/default/files/ctf_140609.tar.gz" 'LICENSE')
md5sums=('09ac38fd5e55b2480f37203650298642' 'SKIP')
options=()

prepare () {
	echo "The program CTFFIND3 is an updated version of the program CTFFIND2, which was developed in 1998 by Nikolaus Grigorieff at the MRC Laboratory of Molecular Biology in Cambridge, UK with financial support from the MRC. This software is licensed under the terms of the Janelia Research Campus Software Copyright 1.1."
}
build() {
	cd "$srcdir/ctf"
	make -f Makefile_linux
        make -f Makefile_linux_mp
}

package() {
	cd "$srcdir/ctf"
	install -d $pkgdir/usr/bin/ "${pkgdir}/usr/share/licenses/${pkgname}"
	install -D -m755 *.exe $pkgdir/usr/bin/.
        install -D -m644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

