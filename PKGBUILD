# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=1.6.0
pkgrel=1
url="https://matplotlib-pgfutils.readthedocs.io/"
arch=('any')
depends=('python-matplotlib')
checkdepends=('python-pytest' 'python-pytest-cov' 'texlive-core')
license=('BSD')
source=("matplotlib-pgfutils-${pkgver}.tar.gz::https://github.com/bcbnz/matplotlib-pgfutils/archive/v${pkgver}.tar.gz")
sha256sums=('019e1cab6e0b74a870ecb93ed5a8a04472118cdd5808da2909f52df62dd9cc23')

build() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py build
}

check() {
    cd "matplotlib-pgfutils-${pkgver}"
    pytest
}

package() {
    cd "matplotlib-pgfutils-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
