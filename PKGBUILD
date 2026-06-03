# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: pjvm <pjvm742@disroot.org>

pkgname=python-pettingzoo
_name=${pkgname#python-}
pkgver=1.26.1
pkgrel=1
pkgdesc="Gymnasium for multi-agent reinforcement learning"
arch=('any')
url="https://pettingzoo.farama.org/"
license=('MIT')
depends=('python-numpy' 'python-gymnasium')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=('python-pygame-ce: environment rendering, required for many provided environments'
            'python-pybox2d: required for the SISL environments'
            'box2d: required for the SISL environments'
            'python-scipy: required for the SISL environments'
            'python-pymunk: required for the SISL and butterfly environments'
            'python-pillow: required for some environments'
            'python-chess: required for the chess environment'
            'python-rlcard: required for the card game (classic) environments'
            'python-shimmy: required for the OpenSpiel classic environments')
source=("https://files.pythonhosted.org/packages/source/${_name:0:1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('1bae0c7d3c51bf032f2e2abb589b211feec786de76cbbff87f8189ad51649820')

build() {
    cd "$srcdir/$_name-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/$_name-$pkgver"
    PYTHONPATH="$PWD:$PYTHONPATH" python -c "import pettingzoo; print(getattr(pettingzoo, '__version__', 'ok'))"
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
