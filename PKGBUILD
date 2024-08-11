# Maintainer: karboncore

pkgname=python-recipe-scrapers-git
pkgver=1416.3834dfc9
pkgrel=1
pkgdesc='Python package for scraping recipes data'
arch=(any)
url=https://github.com/hhursev/recipe-scrapers
license=(MIT)
depends=(python-bs4 python-extruct-git python-isodate python-requests)
makedepends=(git python-build python-wheel python-installer)
provides=(${pkgname%-git})
source=(git+https://github.com/hhursev/recipe-scrapers.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/recipe-scrapers"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/recipe-scrapers"
  python -m build -wn
}

package() {
  cd "$srcdir/recipe-scrapers"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-git}/
}
