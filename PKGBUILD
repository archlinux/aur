# Maintainer: pjvm <pjvm742@disroot.org>

pkgname=python-pettingzoo
_name=${pkgname#python-}
pkgver=1.24.2
pkgrel=1
pkgdesc="Framework for multi-agent reinforcement learning"
arch=('any')
url="https://pettingzoo.farama.org/"
license=('MIT AND Apache-2.0')
depends=('python-numpy' 'python-gymnasium' 'python-farama-notifications')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=('python-pygame: environment rendering, required for many provided environments'
            'python-pybox2d: required for the SISL environments'
            'box2d: required for the SISL environments'
	    'python-scipy: required for the SISL environments'
	    'python-pymunk: required for the SISL and butterfly environments'
	    'python-pillow: required for some environments'
	    'python-chess: required for chess environment'
	    'python-rlcard: required for card game environments'
	    'python-shimmy: required for some of the classic environments')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
	"LICENSE-${pkgver}::https://raw.githubusercontent.com/Farama-Foundation/PettingZoo/${pkgver}/LICENSE")
sha256sums=('0a5856d47de78ab20feddfdac4940959dc892f6becc92107247b1c3a210c0984' # from PyPI
            '57569ca4221c4cbf9a035d1280d142550b7021722a70ffd79c318ae382689cc4')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
