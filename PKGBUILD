
pkgname=python-art
_name=${pkgname#python-}
pkgver=6.5
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
b2sums=('93559a0449160f5fc04948690a025a6edf9ad064f7e674bc93f5da776dc4970ce9a089718b724a38e03cc96588614431dc2dd873376f52d243f853325ba82d67')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
