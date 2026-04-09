# Maintainer: Agil Mammadov <mammadovagil at tutamail dot com>
# Maintainer: Baptiste Jonglez <archlinux at bitsofnetworks dot org>
# Contributor: Patrice Peterson <runiq at archlinux dot us>

_pkgname=latexcodec
pkgname=python-${_pkgname}
pkgver=3.0.1
pkgrel=2
pkgdesc="A lexer and codec to work with LaTeX code in Python"
arch=('any')
url="https://github.com/mcmtroffaes/latexcodec"
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mcmtroffaes/${_pkgname}/archive/${pkgver}.tar.gz")
sha256sums=('f59eeba7fef0bd4b58bdecffa10a738c7a479a68590bd7d2bd97bdc2dcaa776e')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py build
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  PYTHONPATH=. pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
