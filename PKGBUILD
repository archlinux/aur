# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-optuna
pkgver=4.2.0
pkgrel=2
pkgdesc="A hyperparameter optimization framework"
arch=('any')
url="https://optuna.org"
license=('MIT')
makedepends=("python-setuptools"
    "python-wheel")
depends=("python"
    "python-alembic"
    "python-colorlog"
    "python-numpy"
    "python-packaging"
    "python-sqlalchemy"
    "python-tqdm"
    "python-pyyaml")
optdepends=() # Too many to list here
_name=${pkgname#python-}
source=("$pkgname-$pkgver.tar.gz::https://github.com/optuna/$_name/archive/v$pkgver.tar.gz")
sha256sums=('65903cd420ff59dde99c2b224d5207031acf5dbc5080d9d404c91471a24cd583')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 LICENSE_THIRD_PARTY "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE_THIRD_PARTY"
}
