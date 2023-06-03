# Maintainer: Robin Broda <coderobe at archlinux dot org>

pkgname=python-xtarfile
pkgver=0.1.0
pkgrel=5
pkgdesc='Wrapper around tarfile to add support for more compression formats'
arch=('any')
url=https://github.com/ascoderu/xtarfile
license=('Apache')
depends=('python-zstandard' 'python-lz4')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ascoderu/xtarfile/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('f13c37c8a66e13d940148a5b1310cedf5391ddb44f6730faeb8cc6b3ff2268f1')

prepare() {
  cd xtarfile-$pkgver
  echo $pkgver > version.txt
}

build() {
  cd xtarfile-$pkgver
  python setup.py build
}

check() {
  cd xtarfile-$pkgver
  python -m unittest discover -vs .
}

package() {
  cd xtarfile-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
