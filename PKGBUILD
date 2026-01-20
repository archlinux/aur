# Maintainer: chadsr <git@ross.ch>

pkgname=waybar-crypto
pkgver=1.6.1
pkgrel=1
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-hatchling')
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
sha512sums=("d708097ea4d5868ca2e1eb58003d5c501a877e9563abd14d48da3c057840bbce2fd1b4f5818ccaee0cc4aa6d1e419733920f79539ee74fb6132ff87ddcc1bbc6")
provides=("$pkgname")

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
