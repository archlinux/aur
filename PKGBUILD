# Maintainer: Jonas Bengtsson <jonas@bengtsson.cc>

pkgname=autocrc
pkgver=2.0.0
pkgrel=1
pkgdesc="Automated CRC-checking"
arch=(any)
url="https://github.com/ljb/autocrc"
license=('GPL-3.0-or-later')
depends=(python)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('409e8c81df5f29ce9bbe3cec0eca8046360cf0a231b5a4b6e08f8bfe586c2061')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$pkgname-$pkgver"
    pytest
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
