# Maintainer: Vincent Schult <viboschu@gmail.com>

pkgname=eigengdb-git
pkgver=r23.c741ede
pkgrel=1
pkgdesc="Pretty printer for eigen types (with some support for stan-math types)."
arch=('any')
url="https://github.com/dmillard/eigengdb"
license=(MPL-2.0)
install="${pkgname}.install"

depends=(
  gdb
  python
  python-numpy
)
makedepends=(
  git
  python-setuptools
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=("${pkgname%-git}::git+https://github.com/dmillard/eigengdb.git")
sha256sums=('SKIP')

pkgver(){
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build(){
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
