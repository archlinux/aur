# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>

# TODO: move optional python38-requests-cache

pkgname=python38-pandas-datareader
pkgver=0.10.0
pkgrel=2
pkgdesc="Data readers extracted from the pandas codebase"
arch=('any')
url="https://github.com/pydata/pandas-datareader"
license=('BSD')
depends=('python38-pandas' 'python38-lxml' 'python38-requests')
makedepends=('python38-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/pydata/pandas-datareader/archive/v${pkgver}.tar.gz")
sha256sums=('73385b23d42599c6f6f34966f0f22287acd8b775917d5694ae6df4adaf0d0add')

build() {
  cd "$srcdir"/pandas-datareader-${pkgver}
  python3.8 setup.py build_ext --inplace
  python3.8 setup.py build
}

package() {
  cd "$srcdir"/pandas-datareader-${pkgver}
  python setup.py install --skip-build --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE.md "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
