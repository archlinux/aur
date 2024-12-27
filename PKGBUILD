# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: spider-mario <spidermario@free.fr>
# Contributor: Jerome Leclanche <jerome@leclan.ch>
pkgname=python-pulp
_name=${pkgname#python-}
pkgver=2.9.0
pkgrel=2
pkgdesc="A Linear Programming modeler written in Python"
arch=("any")
license=("BSD")
url="https://github.com/coin-or/pulp"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz)
sha256sums=('4c193f927f3dad282c57c18262cfac13fc19005430ea2aaac4802166ce14b768')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
