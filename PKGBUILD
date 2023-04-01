# Maintainer:
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-envisage
pkgver=6.1.0
pkgrel=2
pkgdesc="Extensible Application Framework"
arch=(any)
url="https://github.com/enthought/envisage"
license=(BSD)
depends=(python-apptools python-traitsui)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('ipython: for IPython shell plugin')
source=(https://github.com/enthought/envisage/archive/$pkgver/$pkgname-$pkgver.tar.gz
        https://github.com/enthought/envisage/commit/f23ea386.patch)
sha256sums=('4576e5e1028a2bc2f2c8dc253af9d4b2b615bca694707cc185f2a052d6b0b6d4'
            'fab5b1ed3eed0baed51731b2001bee89743f43ee2b8ea4fc7838a1650586c0a4')

prepare() {
  cd envisage-$pkgver
  patch -p1 < ../f23ea386.patch # Fix compatibility with traits 6.4
}

build() {
  cd envisage-$pkgver
  python -m build --wheel --no-isolation
}

package() {
  cd envisage-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
