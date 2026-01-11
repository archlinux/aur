# Contributor: Andrzej Giniewicz <gginiu@gmail.com>

pkgname=python-traits
pkgver=7.1.0
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
sha256sums=('fbf58323ed78d94d7e17f7f93de55dcbd114f9ae8f1407950420e031da2c8c14')

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
