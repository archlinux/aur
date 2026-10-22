# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_pyname=lizard
pkgname=python-$_pyname
pkgver=1.24.2
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
b2sums=('4f4ddf444815a4546090325f683cb1254ac7af1af1cc5fa78399853373861a41597cad8ed4efd45bd73316238dbbab86ad7e3d464ed80d34145fb7452e534c39')

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
