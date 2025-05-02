# Maintainer: n0n1m
# Maintainer: mbutsk

_name=aiomax
pkgname=python-$_name-git

pkgver=1.0.1.r0.gc4451a8

pkgver() {
  cd "$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

pkgrel=1
pkgdesc="The asynchronous library for Max"
arch=('any')
url="https://github.com/dpnspn/aiomax"
license=('MIT')
depends=(python3 python-aiohttp)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=("git+$url.git")
sha256sums=('SKIP')
conflicts=(python-aiomax)

build() {
    cd $_name
    python -m build --wheel --no-isolation
}

package() {
    cd $_name
    python -m installer --destdir="$pkgdir" dist/*.whl
}
