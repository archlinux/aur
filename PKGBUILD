# Maintainer: Jesse R Codling <codling at umich dot edu>
# Contibutor: dianlujitao <dianlujitao at gmail dot com>

pkgname=python-hdf5storage
pkgver=0.2.1
pkgrel=1
pkgdesc="Read and write a wide range of Python types to/from HDF5 formatted files."
url="https://github.com/jclds139/hdf5storage"
depends=('python' 'python-numpy' 'python-h5py')
makedepends=('python-poetry-core' 'python-installer' 'python-build')
checkdepends=('python-ruff' 'python-pytest')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dce0c7f010dd6854ce0382be0d8432c4869a0ca1c85155cb7e2fca609d42241e')

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
