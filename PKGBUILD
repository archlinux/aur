# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qmsolve
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
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
        "$url/blob/main/LICENSE")
b2sums=('298ba828761b8646f9ab46aba0ea67d5fc80a5faa70d461407f744a3f3b88cdacb62983809f3ba52f46f3a4ffc30952321f121c4161a1b0b049f95e6c39c09ea'
        '606d6fcdaaf2f75201271870af96e00450564dfed30b0aec0754f94e5f06de2a7a8d00ed40d42947ddf0633f31bc251bac6140981be866b1ae0ab362e6049f4e')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 ../LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
