# Maintainer: Ryan Petris <ryan@petris.net>

pkgname=pacdb
pkgver=1.0.0
pkgrel=1
pkgdesc='Pacman Database to SQLite Converter'
url='https://github.com/ryanpetris/pacdb'
arch=('any')
license=('GPL3')
depends=(
    'pacman'
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
    'bb021c77e3f1d6daa9df37eb6c5c7a5182c16237a91f70c6a76fc90c25ef3e949bbb7ffb357c31c5a6f104ce79cc6f249c026b9e3ae9087b98786a3daffac6a1'
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
