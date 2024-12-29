# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-glob2
_name=${pkgname#python-}
pkgver=0.7
pkgrel=5
pkgdesc="Version of the glob module that can capture patterns and supports recursive wildcards"
url="https://pypi.org/project/${_name}"
license=('BSD')
arch=('any')
depends=('python')
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools)
checkdepends=('python-pytest')
source=("${_name}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
  $pkgname-warning.patch)
sha512sums=('6707c33782373cd71b1794ef3a143f6c0ceb5733bec944d16596eb4662df4c788328078b621bdda6096da95ec2f267256fca620dd7691eb02bf0ce940dd4150e'
            '9d9fae98fbac70f4b639be9732512e6d4465553947371457feaacb73a7152f25171e98ce427494a4ac571d01da1fa1b3ddae4e15841c178d16b96918108cdde7')

prepare() {
  cd ${_name}-${pkgver}
  patch -p1 -i ../$pkgname-warning.patch
}

build() {
  cd ${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

# check() {
#   cd ${_name}-${pkgver}
#   pytest test.py
# }

package() {
  cd ${_name}-${pkgver}
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
