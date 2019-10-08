# Maintainer: Blair Bonnett <blair dot bonnett at gmail dot com>

pkgname=python-matplotlib-pgfutils
pkgdesc="Utilities for generating PGF figures from Matplotlib"
pkgver=1.2.0
pkgrel=1
url="https://matplotlib-pgfutils.readthedocs.io/"
arch=('any')
depends=('python-matplotlib>=1.2')
checkdepends=('python-pytest' 'python-pytest-cov' 'texlive-core')
license=('BSD')
source=("https://github.com/bcbnz/matplotlib-pgfutils/archive/v${pkgver}.tar.gz")
sha256sums=("4c52a06c2e06b7ec4faef67d834a339f3b3fe35c00a1180b7f1e2d098fa5eba0")

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
