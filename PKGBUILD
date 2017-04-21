# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=eman2
pkgver=2.12
pkgrel=5
pkgdesc="Greyscale scientific image processing suite for processing data from transmission electron microscopes"
arch=(x86_64)
url="http://blake.bcm.edu/emanwiki/EMAN2"
license=('GPL')
depends=('python2-numpy' 'hdf5' 'fftw' 'boost' 'qtwebkit' 'cmake' 'gsl' 'ftgl' 'python2-matplotlib' 'ipython' 'python2-pyqt4' 'python2-opengl')
source=("http://ncmi.bcm.edu/ncmi/software/counter_222/software_133/manage_addProduct/NCMI/attendee_factory/eman$pkgver.linux64.tar.gz" 'eman2.sh')
md5sums=('2e21b310c957fc3b21f8c6b551b60fdb' 'SKIP')
options=(!strip)

prepare () {
	cd "$srcdir/EMAN2"
	sed -i -e s:"EMAN2PYTHON=\$1":"EMAN2PYTHON=/opt/eman2/Python/bin/python":g eman2-installer
}
build() {
	cd "$srcdir/EMAN2"
	./eman2-installer
	echo "Restart computer to refresh eman paths and libraries."
}

package() {
	cd "$srcdir/EMAN2"
	install -d $pkgdir/opt/eman2 $pkgdir/etc/profile.d/
	cp -r * $pkgdir/opt/eman2/.
	install -D -m755 $srcdir/eman2.sh $pkgdir/etc/profile.d/.
}
