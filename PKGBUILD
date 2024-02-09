# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qmsolve
pkgname=python-$_name
pkgver=2.0.0
pkgrel=3
pkgdesc="A module for solving and visualizing the Schrödinger equation"
arch=("any")
url="https://github.com/quantum-visualizations/qmsolve"
license=("BSD")
depends=(python-h5py python-matplotlib python-numpy python-progressbar python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('mayavi: for 3D graphics'
            'python-pyqt5: for 3D graphics'
            'vtk: for 3D graphics')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "https://github.com/quantum-visualizations/qmsolve/blob/main/LICENSE")
b2sums=('298ba828761b8646f9ab46aba0ea67d5fc80a5faa70d461407f744a3f3b88cdacb62983809f3ba52f46f3a4ffc30952321f121c4161a1b0b049f95e6c39c09ea'
        'df96f409010c8b3f34e8f50ce323a7660e4ac2587bd281eb1c24291900e3b938e92a8329fee1fe76d885b6e9f1a203b5e60f320d79a06e2996ec49857dc7ad66')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
