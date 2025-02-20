# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
pkgname=python-pulp
_name=${pkgname#python-}
pkgver=3.0.2
pkgrel=1
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("MIT")
url="https://github.com/coin-or/pulp"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('6328e5d77846501a7b540a9b3fe3c615837786a83521bffcb64e4a8201c53da3')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
