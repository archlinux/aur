# Maintainer: Anton Hvornum <torxed@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname=python-simple-term-menu
pkgver=1.6.3
pkgrel=2
pkgdesc='A Python package which creates simple interactive menus on the command line.'
arch=('any')
url='https://github.com/IngoMeyer441/simple-term-menu'
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools'
)
checkdepends=()
optdepends=()
source=("https://pypi.python.org/packages/source/s/simple-term-menu/simple-term-menu-${pkgver}.tar.gz")
sha512sums=('58dbbc0c01d8b16d12d546568373f88c580c365c7e175b553656a27fc58ceddd608435a2976ee9654e451f9cb76fcd590e37e3417cee3ebaf72c6ebf48d79452')
b2sums=('b38b04a7ba34c0cc95bfd2ae990bd6472f663d819a7362f8fec9dcdb0c59d8aa21da49a78b32739b8ebbbc83c655d92a259af545f5d1d82920b533bf387d343b')

pkgver() {
  echo $pkgver
}

build() {
  cd "simple-term-menu-$pkgver"

  python setup.py build
}

package() {
  cd "simple-term-menu-$pkgver"

  cd "${srcdir}/${pkgname#*-}-${pkgver}" || return
  python setup.py install --optimize=1 \
                          --prefix=/usr \
                          --root="${pkgdir}" \
                          --skip-build

  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
