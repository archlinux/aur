# Maintainer: getzze <getzze at gmail dot com>

pkgname='python-pymemoize'
pkgver=1.0.3
pkgrel=4
pkgdesc="Simple Python cache and memoizing module"
arch=(any)
url="https://github.com/mikeboers/PyMemoize"
license=('BSD')
options=(!emptydirs)
source=("https://github.com/mikeboers/PyMemoize/archive/v${pkgver}.tar.gz")
sha256sums=('21946d8cf60b80f71438256d8376b76375002ecfbb95d792588f22bea79cd0ee')
makedepends=('git' 'python-setuptools' 'python2-setuptools')
depends=('python')
optdepends=('python-django' 'python-redis')

prepare() {
  cd "$srcdir/PyMemoize-${pkgver}"
  # patch for python3.10
  sed -id 's#from collections import#from collections.abc import#' memoize/options.py
}

package() {
  cd "$srcdir/PyMemoize-${pkgver}"
  install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  python setup.py install --root="$pkgdir/" --optimize=1
}
