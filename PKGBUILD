# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=7.0.2
pkgrel=1
pkgdesc="Explicitly typed attributes for Python"
arch=('x86_64')
url="https://github.com/enthought/traits"
license=('BSD')
depends=('python')
optdepends=('python-numpy: to support the trait types for arrays'
            'python-traitsui: to support Gui Views')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
source=("traits-${pkgver}.tar.gz::https://github.com/enthought/traits/archive/${pkgver}.tar.gz")
sha256sums=('d916cff57a1c7f393a82d01bf89ca227fc33225b13dd0e93e99ae72272f5062e')

build() {
  cd traits-$pkgver

  CFLAGS+=" -Wno-implicit-function-declaration" \
  python -m build --wheel --no-isolation
}

package() {
  cd traits-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
