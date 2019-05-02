# Maintainer: Tinu Weber <https://gnugen.ch/~mtweber>

pkgname=epfl-menu-git
pkgver=r16.2406823
pkgrel=6
arch=(any)

pkgdesc='Pretty-print the lunch and supper menus at the EPFL'
url='https://github.com/gcmalloc/epfl-menu'
license=(custom:Beerware)

depends=(python)
makedepends=(coreutils python-setuptools)

conflicts=(epfl-menu)
provides=(epfl-menu)

source=('git+https://github.com/gcmalloc/epfl-menu')
md5sums=(SKIP)

pkgver() {
  cd epfl-menu
  printf 'r%d.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd epfl-menu
  python3 setup.py build
}

package() {
  depends+=(python-beautifulsoup4 python-urllib3)

  cd epfl-menu
  python3 setup.py install --root="$pkgdir" --optimize=1

  mkdir -p "$pkgdir"/usr/share/licenses/"$pkgname"
  head -n8 epfl/menu.py >"$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
