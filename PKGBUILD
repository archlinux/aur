# Maintainer: chadsr <git at ross dot ch>

pkgname=waybar-crypto
pkgver=1.6.1 # renovate: datasource=github-releases depName=chadsr/waybar-crypto
pkgrel=2
pkgdesc='A Waybar module for displaying cryptocurrency market information from CoinMarketCap.'
arch=('any')
url='https://github.com/chadsr/waybar-crypto'
depends=('python' 'python-requests')
makedepends=('python-build' 'python-installer' 'python-hatchling')
license=('MIT')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
b2sums=('dc5072ef0a569d2007c758bcda09345baa4afc2a2542af708ac5e386d6ef4eafc4aebbd5ae0fcd490f30fa1b5e1a763a10411cdc4b21f109c4872de29f8f84c1')

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
