# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-chws-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.2
pkgrel=1
pkgdesc="Utility for OpenType chws/vchw features"
arch=('any')
url="https://github.com/googlefonts/chws_tool"
license=('Apache-2.0')
depends=('python'
         'python-east-asian-spacing')
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('97760a4fca01443164d562fd2fb84e0a5796f5ea8991d340c33c92c777be5ea5')

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
