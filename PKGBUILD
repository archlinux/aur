# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-east-asian-spacing
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.5
pkgrel=1
pkgdesc="East Asian Contextual Spacing Build Tools"
arch=('any')
url="https://github.com/kojiishi/east_asian_spacing"
license=('Apache-2.0')
depends=('python'
         'python-fonttools'
         'python-brotli'
         'python-zopfli'
         'python-uharfbuzz')
makedepends=('python-build'
             'python-installer'
             'python-hatchling'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('c46b23d885cb6555120858e4817b14d2a57d31a4628ca39475de43d24bb05f20')

build() {
    cd $_name-$pkgver
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    python tests/download_fonts.py
    PYTHONPATH="$PWD/src" pytest -o addopts=""
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
