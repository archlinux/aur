# Maintainer: Joe Holden <jwh@zorins.us>
_pkgname=onionbalance
pkgname=${_pkgname}-git
pkgver=r275.d8d03f5
pkgrel=1
pkgdesc='Onionbalance'
arch=('any')
license=('GPL-3.0')
depends=(tor python-setuptools)
makedepends=('git')
url='https://gitlab.torproject.org/tpo/core/onionbalance'
source=("git+https://gitlab.torproject.org/tpo/core/onionbalance.git")
sha256sums=('SKIP')

pkgver() {
  cd $srcdir/$_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd $srcdir/$_pkgname
  python setup.py build
}

package() {
  cd $srcdir/$_pkgname
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
