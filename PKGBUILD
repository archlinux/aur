# Maintainer: Grey Christoforo <first name at last name dot net>

pkgname=python2-pico-git
_pkgname=pico-python
pkgver=r134.f688d7e
pkgrel=1
pkgdesc="PicoScope Python Interface"
arch=('any')
url="https://github.com/colinoflynn/pico-python"
provides=('python2-pico')
conflicts=('python2-pico')
license=('BSD 2-Clause')
depends=('python2')
makedepends=('python2-setuptools')
source=("${pkgname}"'::git+http://github.com/colinoflynn/pico-python')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}"
  python2 setup.py install --root="${pkgdir}"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
