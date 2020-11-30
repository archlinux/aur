# Maintainer: Bart De Roy <de.roy.bart@gmail.com>
pkgname=scour-git
pkgver=r300.7a83e71
pkgrel=1
pkgdesc="An SVG scrubber"
arch=(any)
license=(Apache)
depends=(python)
makedepends=(git python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/sharethewisdom/${pkgname%-git}"
source=(
  "git+https://github.com/scour-project/${pkgname%-git}.git"
  "git+https://github.com/scour-project/${pkgname%-git}.wiki.git"
)
sha256sums=(SKIP SKIP)

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname%-git}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  if [[ -d "$srcdir/${pkgname%-git}.wiki" ]]; then
    cd "$srcdir/${pkgname%-git}.wiki"
    mkdir -p "${pkgdir}/usr/share/doc/scour"
    install -m 644 * "${pkgdir}/usr/share/doc/scour"
  fi
}
