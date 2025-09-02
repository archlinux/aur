# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-chws-tool-git
pkgver=1.4.4.r2.g275575b
pkgrel=1
pkgdesc="Utility for OpenType chws/vchw features"
arch=('any')
url="https://github.com/googlefonts/chws_tool"
license=('Apache-2.0')
depends=('python'
         'python-east-asian-spacing')
makedepends=('git'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-setuptools-scm'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$pkgname-$pkgver::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname-$pkgver
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd $pkgname-$pkgver
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname-$pkgver
    PYTHONPATH="$PWD/src" pytest
}

package() {
    cd $pkgname-$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
