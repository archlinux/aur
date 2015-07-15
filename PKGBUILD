# Maintainer: Mauro Santos <registosites@hotmail.com>

pkgname=casetta
pkgver=0.3.0
pkgrel=4
pkgdesc="Collection of free (as speech) softwares to open, edit, convert and transfer data with a Casio graphical calculator."
license=('GPL2')
arch=('i686' 'x86_64')
url="http://casetta.tuxfamily.org/"
depends=('python2' 'python2-pyserial' 'python2-pillow' 'gtk' 'pygtk')
makedepends=('python2')
source=("http://download.tuxfamily.org/casetta/casetta-0.3/casetta-$pkgver.tar.gz"
        'fixes20150517.patch')
md5sums=('0d95ce37cacd99f79f826fe06eb4104a'
         'ce51dbbb3e1649051acd671c56bb2065')
PKGEXT='.pkg.tar'

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
