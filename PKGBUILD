# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-chws-tool
_name=${pkgname#python-}
_name=${_name//-/_}
pkgver=1.4.4
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
sha256sums=('6f6731befe8798514f6c4374c6bf446fae071b2eafe6a60b5f578b389559a6da')

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
