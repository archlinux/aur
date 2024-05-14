# Maintainer: Marco Rubin <marco.rubin@protonmail.com>

_name=qmsolve
pkgname=python-$_name
pkgver=2.0.0
pkgrel=1
pkgdesc="A module for solving and visualizing the Schrödinger equation"
arch=("any")
url="https://github.com/quantum-visualizations/qmsolve"
license=("BSD-3-Clause")
depends=(python-h5py python-matplotlib python-numpy python-progressbar python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('mayavi: for 3D graphics'
            'python-pyqt5: for 3D graphics'
            'vtk: for 3D graphics')
source=("$url/archive/$pkgver.tar.gz")
b2sums=('ab7cc38f6a15e1fddc5f0bb234c3a2d72e869a46149639f79945c6f092597c95db62d98fdba43792862f70ec168fd6ce5d355869536c68ff1d80b1a427594a5f')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
