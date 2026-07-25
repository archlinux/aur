# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=pylnker-git
_pkgname=pylnker
pkgver=r35.1473061
pkgrel=1
pkgdesc="A tool to parse Windows .lnk files."
url="https://github.com/KillerInstinct/pylnker"
depends=('python')
makedepends=('git')
conflicts=(pylnker)
provides=(pylnker)
license=('GPL')
arch=('any')
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
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}


# vim:set ts=2 sw=2 et:
