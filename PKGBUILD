# Maintainer: Robin Broda <coderobe at archlinux dot org>

pkgname=python-xtarfile
pkgver=0.2.1
pkgrel=3
pkgdesc='Wrapper around tarfile to add support for more compression formats'
arch=('any')
url=https://github.com/ascoderu/xtarfile
license=('Apache')
depends=('python-zstandard' 'python-lz4')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ascoderu/xtarfile/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('a01270336caaae2c91b4e73d6bdaae2b40dcbd3308d917baa6e8fa8dbcc7a99a')

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
