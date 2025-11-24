# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_pyname=lizard
pkgname=python-$_pyname
pkgver=1.19.0
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
b2sums=('b4fd02b2e99d1cfcb9043402f6831b0386d268df5df3c27abc9ac6360379f94e48871ff15778846ed0f2154690457ef6e57dfe71ed0f55703bc6e923fe403f7b')

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
