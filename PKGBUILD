# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=python-snakemake-interface-common
_name=${pkgname#python-}
pkgver=1.24.0
pkgrel=1
pkgdesc="Common functions and classes for Snakemake and its plugins"
arch=('any')
url="https://github.com/snakemake/snakemake-interface-common"
license=('MIT')
makedepends=(python-build python-installer python-wheel python-setuptools)
depends=(python-argparse_dataclass python-configargparse python-packaging)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('8bb2dfc4ef68d589b0d323cda88f613bd0c317d85ea43139e8dbc03dfc287939')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
