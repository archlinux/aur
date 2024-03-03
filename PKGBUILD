
pkgname=python-art
_name=${pkgname#python-}
pkgver=6.1
pkgrel=1
pkgdesc="ASCII art library for Python"
arch=('any')
url='https://github.com/sepandhaghighi/art/'
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
source=("${_name}-${pkgver}.tar.gz::https://github.com/sepandhaghighi/${_name}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('f7f27cdad10640a87b0e4fcbf8f652b0f792e81d944e1f31fcc7119e706952522e1f61c928f4de451cd8b418f01456ba17917ed604e7ed63ff845d9fb43b2cd5')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
