# Maintainer: Urbain Vaes <urbain at vaes dot uk>

pkgname=python-hermipy-git
_gitname=hermipy
pkgver=r580.627564d
pkgrel=1
pkgdesc="Library for the Hermite spectral method"
arch=(any)
url="https://github.com/urbainvaes/hermipy"
license=(GPL)
makedepends=(git python-setuptools cmake boost boost-libs)
depends=(python-sympy python-numpy python-scipy)
source=("git+https://github.com/urbainvaes/hermipy")
md5sums=(SKIP)

pkgver() {
    cd $_gitname
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

build() {
  cd $_gitname
  python setup.py build
}

package() {
  cd $_gitname
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
