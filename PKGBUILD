# Maintainer: lmartinez-mirror
pkgname=python-randomfiletree
_name=RandomFileTree
pkgver=1.2.0
pkgrel=3
pkgdesc="Creates a random file and directory tree/structure for testing"
arch=('any')
url="https://github.com/klieret/randomfiletree"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
provides=('randomfiletree')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "LICENSE::https://raw.githubusercontent.com/klieret/RandomFileTree/master/LICENSE.txt")
sha256sums=('3a92e12ecbf093dc6b3fc1405c69030ed32db3a8a4a71f28724bd347f4c49afc'
            '4da4a2f04603fcd10ee2868810e9863c0a55165f42a969bd8c31b42ec7e058f7')

prepare() {
  ## dirty fix for incorrect permissions for egg-info in tarball
  cd "$_name-$pkgver/${_name}.egg-info"
  chmod 644 *
}

build() {
  cd "$_name-$pkgver"
  python setup.py build
}

package() {
  cd "$_name-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
