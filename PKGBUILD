# Maintainer: Tjw123hh Pigmonky <tjw123hh@outlook.com>
pkgname=python-chws-tool-git
pkgver=1.4.5.r7.gf6e24c9
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
             'python-hatchling'
             'python-wheel')
checkdepends=('python-pytest'
              'python-pytest-asyncio')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd $pkgname
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/-/.r/;s/-/./'
}

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname
    PYTHONPATH="$PWD/src" pytest
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
}
