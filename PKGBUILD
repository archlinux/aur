# Maintainer: Smoolak <smoolak@gmail.com>

_pkgname=gym-pusht
_module=gym_pusht
pkgname=python-gym-pusht
pkgver=0.1.6
pkgrel=1
pkgdesc="A gymnasium environment for PushT"
arch=('any')
url="https://github.com/huggingface/gym-pusht"
license=('Apache-2.0')
depends=(
    'python'
    'python-gymnasium'
    'python-opencv'
    'python-pygame'
    'python-pymunk'
    'python-shapely'
    'python-scikit-image'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-poetry-core'
)
optdepends=(
    'python-pre-commit: for the dev extra'
    'python-debugpy: for the dev extra'
    'python-pytest: for the test extra'
    'python-pytest-cov: for the test extra'
)
source=("https://files.pythonhosted.org/packages/source/g/$_pkgname/${_module}-$pkgver.tar.gz")
sha256sums=('b748dc5282c41b504df16359df26d3c2184e194edd20cde691fcda9fdc277005')

build() {
    cd "$srcdir/${_module}-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_module}-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import gym_pusht; print(getattr(gym_pusht, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/${_module}-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
