# Maintainer: Tinu Weber <martin.weber@epfl.ch>

pkgname=epfl-menu
pkgver=r10.9b4a45c
pkgrel=1
pkgdesc='Pretty-print the lunch and supper menus at the EPFL'
arch=('any')
url='https://github.com/gcmalloc/epfl-menu'
license=('custom:Beerware')
makedepends=('python2' 'python2-setuptools')
source=('git+https://github.com/gcmalloc/epfl-menu')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  python2 setup.py build
}

package() {
  depends=('python2' 'python2-beautifulsoup3' 'python2-urllib3')
  cd "$srcdir/$pkgname"
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir"/usr/bin/menu "$pkgdir"/usr/bin/epfl-menu
  mkdir -p "$pkgdir"/usr/share/licenses/epfl-menu
  head -n 8 epfl/menu.py > "$pkgdir"/usr/share/licenses/epfl-menu/LICENSE
}
