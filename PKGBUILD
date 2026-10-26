# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru')
_name=pylru
pkgver=1.3.3
pkgrel=1
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('MIT')
makedepends=(python-build python-installer python-setuptools)
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/jlhutch/pylru/archive/v${pkgver}.tar.gz"
         https://github.com/jlhutch/pylru/pull/34/commits/a0eb3c80d258b2524c67d362f2a5ac4ee9695fec.patch)
sha256sums=('036d4cc97ed611faa3dfe237ec920c9b5ffd1c3373140ea91c59e81b00d21d45'
            'ae757cfaf1db21b381f352510c362b624d3a9a3923c2918b0fca128f26191490')

prepare() {
  cd "${srcdir}/${_name}-${pkgver}"
  patch --forward --strip=1 < "../a0eb3c80d258b2524c67d362f2a5ac4ee9695fec.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_name}-${pkgver}"
  python test.py
}

package_python-pylru() {
  depends=('python')
  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
