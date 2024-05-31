# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.5.6
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("1291a610f71378f41da18020462ba9817a8c1a23fd43543fcab70629154fc2f55ac1abb95483fce48223f23bfdc2b26a8c7d0ed89714376688a8306953417b41")
provides=("$pkgname")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname/"

    cd "$pkgdir"
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
}