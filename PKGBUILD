# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-optuna
pkgver=5.0.0
pkgrel=1
pkgdesc="A hyperparameter optimization framework"
arch=('any')
url="https://optuna.org"
license=('MIT')
makedepends=("python-setuptools"
    "python-wheel"
    "python-build"
    "python-installer")
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
sha256sums=('2f0978e601e3196c433d54565dc3e4a5881ad8514a9c4013df82a67636322138')

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
