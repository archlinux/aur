# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contibutor: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.2.0
pkgrel=1
pkgdesc="Read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/jclds139/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-poetry-core' 'python-installer' 'python-build')
checkdepends=('python-ruff' 'python-pytest')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('08a408811fb85e08508caadc28d4a8b4b233c56d14c7278854e6f9e7e92949ff')

build() {
    cd hdf5storage-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd hdf5storage-$pkgver
    python -m venv test-env --system-site-packages
    test-env/bin/python -m installer dist/*.whl
    test-env/bin/python -m pytest
}


package() {
    cd hdf5storage-$pkgver
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 COPYING.txt $pkgdir/usr/share/licenses/$pkgname/COPYING.txt
}
