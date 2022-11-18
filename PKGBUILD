# Maintainer: amadejpapez <amadej.papez@gmail.com>

pkgname=python-name-that-hash
_pkgname=Name-That-Hash
pkgver=1.11.0
pkgrel=3
pkgdesc="The Modern Hash Identification System."
arch=("any")
url="https://github.com/HashPals/Name-That-Hash"
license=("GPL3")
depends=("python" "python-click" "python-rich")
makedepends=("python-build" "python-installer" "python-poetry-core")
source=("${url}/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=("2f8dd4beaf7326d2f664f18205c024848dcb627ff29ceffb22ab410fbef2d761")

prepare() {
    cd "${_pkgname}-${pkgver}"
    dephell deps convert --from pyproject.toml --to setup.py
}

build() {
	cd $_pkgname-$pkgver
	python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
	cd $_pkgname-$pkgver
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
