# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Fazlul Shahriar <fshahriar@gmail.com>

_pkgname=python-kasa
pkgname="$_pkgname-git"
pkgver=0.6.2.1.r49.g7507837
pkgrel=1
pkgdesc="Python library to control TPLink's smart home devices, Git version"
arch=('any')
url='https://github.com/python-kasa/python-kasa'
license=('GPL-3.0-only')
depends=(python-aiohttp python-asyncclick python-async-timeout python-pydantic python-yarl)
makedepends=(git python-build python-installer python-wheel python-poetry-core)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/$_pkgname/$_pkgname.git")
b2sums=('SKIP')

pkgver() {
    cd "$_pkgname"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$_pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
