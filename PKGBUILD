# Maintainer: karboncore

pkgname=python-extruct-git
pkgver=550.3bf7546
pkgrel=1
pkgdesc='Extract embedded metadata from HTML markup'
arch=(any)
url=https://github.com/scrapinghub/extruct
license=(BSD)
depends=(python-html-text python-jstyleson python-lxml python-lxml-html-clean python-mf2py
         python-pyrdfa3 python-rdflib python-w3lib)
makedepends=(git python-build python-wheel python-installer)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
source=(git+https://github.com/scrapinghub/extruct.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/extruct"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/extruct"
  python -m build -wn
}

package() {
  cd "$srcdir/extruct"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-git}/
}
