# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contibutor: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.1.19
pkgrel=3
pkgdesc="Read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/frejanordsiek/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-setuptools' 'python-installer' 'python-build')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9618d370277ad2a38dc3981d1f67fe02e8a413e1a682990526dafa689dc2b32f')

prepare () {
	cd hdf5storage-$pkgver

	find hdf5storage/ -iname '*.py' -exec sed -ie 's/unicode_/str_/g' {} \;
	# temporary patch for numpy >= 2.0
}

build() {
    cd hdf5storage-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd hdf5storage-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
}
