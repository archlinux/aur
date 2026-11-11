# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_pyname=lizard
pkgname=python-$_pyname
pkgver=1.26.0
pkgrel=1
pkgdesc="Code analyzer for Java, C/C++, JavaScript, Python, Ruby, Swift and Objective C"
arch=('any')
url="https://github.com/terryyin/lizard"
license=('MIT')
depends=(
    'python'
    'python-flask'
    'python-jinja'
    'python-pathspec'
    'python-pygments'
)
makedepends=(
    'python-build'
    'python-flask'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-mock'
    'python-pytest'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/terryyin/lizard/archive/refs/tags/${pkgver}.tar.gz")
b2sums=('05c006df3c458aa014a5f8b9dfb99be2e679fa5a7e53a589b1fb28d5bfeffe87cdd953222cdfe899b5e8d69c366df9c0dabcc7b4c1cca24fee1c4dd4fc08d420')

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
