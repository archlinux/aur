# Maintainer: Benoît Allard <benoit.allard@gmx.de>
pkgname=python-optuna
pkgver=4.4.0
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
sha256sums=('77dea5dd7d06ceb08a7d5b2e007244c84ba474635ed8908c30940242c8b34479')

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
