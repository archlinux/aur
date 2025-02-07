# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: Niklas <dev@n1klas.net>

pkgbase=python-pylru
pkgname=('python-pylru')
_name=pylru
pkgver=1.2.1
pkgrel=2
pkgdesc="A least recently used (LRU) cache implementation"
arch=('any')
url="https://github.com/jlhutch/pylru"
license=('GPL2')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("${_name}-${pkgver}.tar.gz::https://github.com/jlhutch/pylru/archive/v${pkgver}.tar.gz"
         https://github.com/jlhutch/pylru/pull/34/commits/a0eb3c80d258b2524c67d362f2a5ac4ee9695fec.patch)
sha256sums=('8d8d5ac67c5567137c53cf505a851a0c125666bd64402a111f141ae35db00859'
            'ae757cfaf1db21b381f352510c362b624d3a9a3923c2918b0fca128f26191490')

prepare() {
  cp -a ${_name}-${pkgver}{,-python2}
  cd "${srcdir}/${_name}-${pkgver}"
  pwd
  patch --forward --strip=1 < "../a0eb3c80d258b2524c67d362f2a5ac4ee9695fec.patch"
}

build() {
  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py build
}

package_python-pylru() {
  depends=('python')

  cd "${srcdir}/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --skip-build --optimize=1
}
