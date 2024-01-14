# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=pacdb
pkgver=1.0.1
pkgrel=1
pkgdesc='Pacman Database to SQLite Converter'
url='https://github.com/ryanpetris/pacdb'
arch=('any')
license=('GPL3')
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
    'c74ab54c595d9a49274b60b4c6226dd41dc6df45b50a6beaefbcac95272d5d030ed7a188c298d9110c098b49cc414c9f5d64f9d475cdebe2665531f626d30d63'
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
