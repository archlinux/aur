# Maintainer: Bart De Roy <de.roy.bart@gmail.com>
pkgname=python-svgpathtools-git
pkgver=r179.45dc873
pkgrel=1
pkgdesc="manipulate and analyze SVG Path objects and Bezier curves"
arch=(any)
url="https://github.com/mathandy/svgpathtools"
license=('MIT')
depends=(python-numpy python-svgwrite)
makedepends=(git python-setuptools)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=( "${pkgname%-git}::git+${url}.git")
md5sums=('SKIP')

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
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" *.svg
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname%-git}" README*
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE*
}
