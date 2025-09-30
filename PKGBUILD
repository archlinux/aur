# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contibutor: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.2.2
pkgrel=1
pkgdesc="Read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/jclds139/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-poetry-core' 'python-installer' 'python-build')
checkdepends=('python-ruff' 'python-pytest' 'python-pytest-cov')
optdepends=('python-scipy')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('ae1526335e0890bd1040cd260e1c30208443c8e17e3b6eb797dc66bf54906fa5')

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
