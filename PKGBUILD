# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.7
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("15ead166b5ce8697a04a3bd5854d5de8c209281ecdc317b5272e192f3026cc130ad172f8e32f33b1e83cb6df585be697ee75dc14ac409c9654ef3840aac9ec52")
provides=("$pkgname")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "$pkgdir"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
}
