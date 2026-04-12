# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru')
_name=pylru
pkgver=1.3.1
pkgrel=2
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL-2.0-only')
makedepends=(python-build python-installer python-wheel)
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/jlhutch/pylru/archive/v${pkgver}.tar.gz"
         https://github.com/jlhutch/pylru/pull/34/commits/a0eb3c80d258b2524c67d362f2a5ac4ee9695fec.patch)
sha256sums=('312e3ecfc1b3b4afa8cf94f60cf42b9f37e32e0baf4a403e85a7729f6f9a7bc1'
            'ae757cfaf1db21b381f352510c362b624d3a9a3923c2918b0fca128f26191490')

prepare() {
  cp -a ${_name}-${pkgver}{,-python2}
  cd "${srcdir}/${_name}-${pkgver}"
  pwd
  patch --forward --strip=1 < "../a0eb3c80d258b2524c67d362f2a5ac4ee9695fec.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python -m build --wheel --no-isolation
}

package_python-pylru() {
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
