# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=pacdb
pkgver=1.1.1
pkgrel=2
pkgdesc='Pacman Database to SQLite Converter'
url='https://github.com/ryanpetris/pacdb'
arch=('any')
license=('GPL-3.0-only')
depends=(
    'pacman'
    'python3'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/ryanpetris/${pkgname}/archive/v${pkgver}.tar.gz"
)
b2sums=(
    'b7895d8f5e5920365fdb3709f21831ddfd45d13610a293dac1003dce095461f51a9bf0605e53f107693ea52be76ee552037ff719a49a8cb394a8dde99d88ac58'
)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    install -Dm 644 sys/systemd/pacdb.service -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm 644 sys/systemd/pacdb.path -t "$pkgdir/usr/lib/systemd/system/"
}
