# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>
# Contributor: PumpkinCheshire <me at pumpkincheshire dot com>

_pyname=lizard
pkgname=python-$_pyname
pkgver=1.17.13
pkgrel=2
pkgdesc="Code analyzer for Java, C/C++, JavaScript, Python, Ruby, Swift and Objective C"
arch=('any')
url="https://github.com/terryyin/lizard"
license=('MIT')
depends=(
    'python'
    'python-jinja'
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
b2sums=('e41e7bb461f64459f9327fa5719e57cc713dcebb89dfb6b01e27f38a9c6014bbe77b1a50cab094a8b68b630385ca9ff3c35b1a9a65545e9c23942f038b560d33')

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
