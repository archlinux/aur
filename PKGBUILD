# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_pyname=lizard
pkgname=python-$_pyname
pkgver=1.24.0
pkgrel=1
pkgdesc="Code analyzer for Java, C/C++, JavaScript, Python, Ruby, Swift and Objective C"
arch=('any')
url="https://github.com/terryyin/lizard"
license=('MIT')
depends=(
    'python'
    'python-jinja'
    'python-pathspec'
    'python-pygments'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-mock'
    'python-pytest'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/terryyin/lizard/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('41828a3dbcb66279396158bd75423121fb45759978bb0f111ffd7e665d33f80a599947cac94d7ba8cfbe02d543ad22a87d9f5b46f7a6e32b273e7d054a280eed')

build() {
    cd $_pyname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_pyname-$pkgver
    PYTHONPATH=build/lib/ pytest
}

package() {
    cd $_pyname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/${pkgname}"
}
