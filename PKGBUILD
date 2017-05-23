# Maintainer: Tinu Weber <martin.weber@epfl.ch>

pkgname=epfl-menu
pkgver=r16.2406823
pkgrel=1
pkgdesc='Pretty-print the lunch and supper menus at the EPFL'
arch=('any')
url='https://github.com/gcmalloc/epfl-menu'
license=('custom:Beerware')
makedepends=('python-setuptools')
source=('git+https://github.com/gcmalloc/epfl-menu')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python3 setup.py build
}

package() {
  depends=('python-beautifulsoup4' 'python-urllib3')
  cd "$srcdir/$pkgname"
  python3 setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir"/usr/bin/menu "$pkgdir"/usr/bin/epfl-menu
  mkdir -p "$pkgdir"/usr/share/licenses/epfl-menu
  head -n 8 epfl/menu.py > "$pkgdir"/usr/share/licenses/epfl-menu/LICENSE
}
