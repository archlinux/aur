# Maintainer: Anton Hvornum <torxed@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Ingo Meyer <i.meyer@fz-juelich.de>

# importlib_metadata is a false positive warning from namcap due to
# backwards compatability import of the script entrypoint.

# python-setuptools is also a false positive due to a third-level
# backwards compatability attempt in script entrypoint.

pkgname=python-simple-term-menu
pkgver=1.6.4
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
sha512sums=('7787c557467c0e8a44fdf61cc094de1e1171c2f9fc82f0607128ca9ad14ce95037b2f4d1cd7e258480415f2704256af36421d389c5c0ca5280d01d5cc675f05a')
b2sums=('6d4e498ee342fe4634944f0281b45ef7af7914eb8b3ceab7e7291b451e26757100c0002f9959150445eb752ca8b5e44ee00436d75ea326bafa2767894dbf7ead')

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
