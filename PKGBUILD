# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-east-asian-spacing
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.2
pkgrel=1
pkgdesc="East Asian Contextual Spacing Build Tools"
arch=('any')
url="https://github.com/kojiishi/east_asian_spacing"
license=('Apache-2.0')
groups=()
depends=('python'
         'python-fonttools'
         'python-brotli'
         'python-zopfli'
         'python-uharfbuzz')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-wheel'
             'python-poetry-core')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('386da894484af034c04ff6b59204d1f03da28c57600f88c0a46de8574d8d7c9d')

build() {
    cd $_name-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python tests/download_fonts.py
    PYTHONPATH="$PWD" pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
