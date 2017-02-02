# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=eman2
pkgver=2.2
pkgrel=1
pkgdesc="Greyscale scientific image processing suite for processing data from transmission electron microscopes"
arch=(x86_64)
url="http://blake.bcm.edu/emanwiki/EMAN2"
license=('GPL')
depends=('python2 libjpeg-turbo python2-numpy hdf5 fftw boost libtiff libpng cmake gsl ftgl python2-matplotlib ipython qt4 python2-pyqt4 python2-opengl')
source=("http://ncmi.bcm.edu/ncmi/software/counter_222/software_135/manage_addProduct/NCMI/attendee_factory/eman$pkgver.linux64.gcc5.tbz" 'eman2.sh' 'eman2-installer')
md5sums=('961c4c16cbb17ddc92e387f4c7ba6556' 'SKIP' 'SKIP')
options=(!strip)

prepare () {
	cd "$srcdir/EMAN2"
	rm eman2-installer
	cp ../eman2-installer .
}
build() {
	cd "$srcdir/EMAN2"
	./eman2-installer
}

package() {
	cd "$srcdir/EMAN2"
	install -d $pkgdir/opt/eman2 $pkgdir/etc/profile.d/
	cp -r * $pkgdir/opt/eman2/.
	install -D -m755 $srcdir/eman2.sh $pkgdir/etc/profile.d/.
}
