# Contributor: karboncore

pkgname=python-humps-git
pkgver=365.a0f712b
pkgrel=1
pkgdesc='Convert strings (and dictionary keys) between snake case, camel case and pascal case in Python'
arch=(any)
url=https://github.com/nficano/humps
license=(unlicense)
depends=(python)
makedepends=(git python-build python-poetry-core python-installer)
provides=(${pkgname%-git})
source=(git+https://github.com/nficano/humps.git)
sha256sums=(SKIP)

pkgver() {
  cd "$srcdir/humps"
  printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/humps"
  python -m build -wn
}

package() {
  cd "$srcdir/humps"
  python -m installer -d "$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}"/usr/share/licenses/${pkgname%-git}/
}
