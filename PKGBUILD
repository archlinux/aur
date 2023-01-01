# Maintainer: Angel Velasquez <angvp@archlinux.org>
# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>

pkgname=python-logilab-common
pkgver=1.9.7
pkgrel=1
pkgdesc="Useful miscellaneous modules used by Logilab projects"
arch=('any')
url="https://www.logilab.org/project/logilab-common"
license=('LGPL')
depends=('python-setuptools' 'python-mypy_extensions' 'python-typing_extensions')
checkdepends=('python-pytz' 'python-pytest')
source=("https://pypi.io/packages/source/l/logilab-common/logilab-common-$pkgver.tar.gz")
sha512sums=('d87217840fa6a65e272ff3f4b2200ff2dbc5e13bd86c02abfee13e888ac1accd27d228965e7cfcca58597ce24a756be1f4f996b7261b88f29abf331a2e8549cd')

build() {
  cd logilab-common-$pkgver
  python setup.py build
}

check() {
  cd logilab-common-$pkgver
  # Running tests outside of an installed package breaks test/test_deprecation.py::StructuredDeprecatedWarningsTest
  python -m pytest test --deselect test/test_deprecation.py::StructuredDeprecatedWarningsTest
}

package() {
  cd logilab-common-$pkgver
  python setup.py install --optimize=1 --skip-build --prefix=/usr --root="$pkgdir"
}
