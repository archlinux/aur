# Maintainer: Mauro Santos <registosites@hotmail.com>

pkgname=casetta
pkgver=0.3.0
pkgrel=4
pkgdesc="Collection of free (as speech) softwares to open, edit, convert and transfer data with a Casio graphical calculator."
license=('GPL2')
arch=('i686' 'x86_64')
url="http://casetta.tuxfamily.org/"
depends=('python2' 'python2-pyserial' 'python2-pillow' 'gtk2' 'pygtk')
makedepends=('python2')
source=("http://download.tuxfamily.org/casetta/casetta-0.3/casetta-$pkgver.tar.gz"
        'fixes20150517.patch')
sha256sums=('6a06ae8d41d188cd716803a0e85a4a25102a01851e5b24538d0794ef50346f44'
            'c29ad28de27826b44346c045d50541b986ce359735272e736a736869c7925419')

prepare() {
    cd "${srcdir}/$pkgname-$pkgver"
    patch -p1 < "${srcdir}/fixes20150517.patch"
}

package() {

	# Build and install
	cd "${srcdir}/$pkgname-$pkgver"
	python2 setup.py install --prefix="${pkgdir}/usr"
    
    # Create link to auto installed icon
    mkdir -p "${pkgdir}/usr/share/icons"
    ln -s /usr/share/gasetta/gasetta.svg ${pkgdir}/usr/share/icons/gasetta.svg
}
