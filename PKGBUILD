# Maintainer: Ross Whitfield <whitfieldre@ornl.gov>
pkgname=('python-nexusformat' 'python2-nexusformat')
_pkgname=nexusformat
pkgver=0.4.4
pkgrel=1
pkgdesc="Provides an API to open, create, and manipulate NeXus data."
url="https://github.com/nexpy/nexusformat"
arch=("any")
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://github.com/nexpy/nexusformat/archive/v${pkgver}.tar.gz")
md5sums=('3be301fcd0d53ef889bcf28646157068')

prepare() {
    cp -a "${srcdir}/$_pkgname-$pkgver"{,-py2}
}

package_python-nexusformat() {
    depends=('python-numpy' 'python-h5py')
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-nexusformat() {
    depends=('python2-numpy' 'python2-h5py')
    cd "$srcdir/$_pkgname-$pkgver-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
    # Conflict with python3 version
    mv $pkgdir/usr/bin/nxstack{,2}
}
