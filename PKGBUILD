# Maintainer: Anton Hvornum <torxed@archlinux.org>
# Maintainer: Giancarlo Razzolini <grazzolini@archlinux.org>
# Contributor: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname=python-simple-term-menu
pkgver=1.6.1
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
sha512sums=('3b24f3b0cff60897f83644901f58fbe9d1131694cd3b62adf219893a771b170ce2183558cba299309d592a8a76c53eb38924a98bdf8ab7cbea341ace1407b9aa')
b2sums=('4aa46609d386638e8e9ff0863f8161de77dd2f2ef3d5c0b0e193a916c1b7484effa72487760fb010998a442d24cd5bcfe93b9debf739b61fd556fddad92d2e26')

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
