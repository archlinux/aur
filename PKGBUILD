# Maintainer: karboncore

pkgname=python-ingredient-parser-git
pkgver=1442.2f4fc96
pkgrel=1
pkgdesc='A tool to parse recipe ingredients into structured data'
arch=(any)
url=https://github.com/strangetom/ingredient-parser
license=(MIT)
depends=(python-nltk nltk-data python-crfsuite python-pint)
makedepends=(git python-build python-wheel python-installer python-setuptools)
provides=(${pkgname%-git})
source=(git+https://github.com/strangetom/ingredient-parser.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/ingredient-parser"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/ingredient-parser"
  python -m build -wn
}

package() {
  cd "$srcdir/ingredient-parser"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-git}/
}
