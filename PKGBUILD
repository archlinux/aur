# Maintainer: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>

pkgname=monkeytype-git
pkgver=v19.11.2.r3.ga586173
pkgrel=1
pkgdesc="Generates static type annotations for Python modules by collecting runtime types"
arch=('any')
url="https://github.com/instagram/MonkeyType"
license=('BSD')
makedepends=('git')
depends=('python' 'python-setuptools' 'python-stringcase' 'python-retype')
conflicts=('monkeytype')
provides=('monkeytype')
source=("git+https://github.com/instagram/MonkeyType")
sha256sums=('SKIP')

pkgver() {
  cd MonkeyType
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd MonkeyType
  python setup.py build
}

package() {
  cd MonkeyType
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/python-monkeytype/LICENSE
}
