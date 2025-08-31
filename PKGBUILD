# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-east-asian-spacing
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.4
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
makedepends=('python-build'
             'python-installer'
             'python-wheel'
             'python-poetry-core')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0e28ef3d7b8a9d2469af44f479be82ced6eba3606c0076b091c9c46b344fcb97')

build() {
    cd $_name-$pkgver
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
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
