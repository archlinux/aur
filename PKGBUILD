# Maintainer: Kyle Keen <keenerd@gmail.com>

pkgname=bdflib-git
pkgver=r147.0b0de2b
pkgrel=1
pkgdesc="A Python library for reading, writing and modifying bitmap fonts in BDF format"
url="https://gitlab.com/Screwtapello/bdflib"
arch=('any')
license=('GPL2')
depends=('python')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer')
conflicts=("bdflib")
provides=("bdflib")
source=(${pkgname}::git+${url})
md5sums=('SKIP')
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}



build() {
  cd "$pkgname"
  python -m build --wheel --no-isolation
}
package() {
  cd "$srcdir/$pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
