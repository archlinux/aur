# Maintainer: Alexandr Parkhomenko <it@52tour.ru>

_author=numpy
_pkgname=numpy-financial
pkgname=python-$_pkgname-git
pkgver=1.0.0.r20.ge3c2a4e
pkgrel=1
pkgdesc='Collection of elementary financial functions'
arch=(
 'any'
)

url='https://github.com/'
license=('BSD 3-Clause')
depends=('python-numpy>=1.15')
makedepends=('git')
provide=('numpy-financial')
source=("git://github.com/$_author/$_pkgname")
sha256sums=('SKIP')

pkgver () {
  cd "$srcdir/$_pkgname"
  git describe --tags --long | sed -r 's/^v//;s/-RC/RC/;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  python setup.py build
}

check() {
  cd "$srcdir/$_pkgname"
  python setup.py test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
