# Maintainer: https://github.com/AlexandrParkhomenko <it@52tour.ru>

_author=dcrosta
_pkgname=flask-pymongo
pkgname=python-${_pkgname}-git
pkgver=2.3.0.r17.g3029f58
pkgrel=1
pkgdesc='MongoDB support for Flask applications.'
arch=(
# 'any'
  'x86_64'
)

url='https://github.com/'
license=('BSD 2-Clause')
depends=('python-flask' 'python-six' 'python-pymongo')
makedepends=('git' 'python')
provides=('python-flask-pymongo')
source=("git://github.com/$_author/$_pkgname")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/$_pkgname"
  git submodule init
  git submodule update
  git fetch --tags
}

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
 #make test
}

package() {
  cd "$srcdir/$_pkgname"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
