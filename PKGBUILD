# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-chws-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.5
pkgrel=1
pkgdesc="Utility for OpenType chws/vchw features"
arch=('any')
url="https://github.com/googlefonts/chws_tool"
license=('Apache-2.0')
depends=('python'
         'python-east-asian-spacing')
makedepends=('python-build'
             'python-installer'
             'python-hatchling'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0ce6066488973046182b2a4316b3c10123cf09d18338e3cbc20999cf7e3e60d5')

build() {
    cd $_name-$pkgver
    SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver python -m build --wheel --no-isolation
}

check() {
    cd $_name-$pkgver
    PYTHONPATH="$PWD/src" pytest
}

package() {
    cd $_name-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
