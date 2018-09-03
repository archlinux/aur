# Maintainer: Ainola
# Contributor: Hugo Osvaldo Barrera
# Contributor: Joel Pedraza

pkgname=python-humblebundle
pkgver=0.1.1
pkgrel=3
pkgdesc="An unofficial library for querying the Humble Bundle API"
arch=('any')
url="https://github.com/saik0/humblebundle-python"
license=('MIT')
depends=('python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/source/h/${pkgname:7}/${pkgname:7}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/saik0/humblebundle-python/master/LICENSE")
sha256sums=('82f7724c286abff1dae6586501ac6a30ea4905652006c7e57d68e03450881222'
            'e54a169f0f2f1cd1039077ef77e5566dfea2cedc61ccf1ab560b2f4c1a1b8025')

build() {
    cd "humblebundle-$pkgver"
    python setup.py build
}

package() {
    # LICENSE file is not included in releases
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
    install -Dm644 "humblebundle-$pkgver"/README.rst -t "$pkgdir/usr/share/doc/$pkgname/"

    cd "humblebundle-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
