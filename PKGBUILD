# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python-rebulk
_name=${pkgname#python-}
pkgver=3.0.1
pkgrel=4
pkgdesc='Define simple search patterns in bulk to perform advanced matching on any string.'
arch=('any')
url='https://github.com/Toilal/rebulk'
license=('MIT')
depends=('python')
makedepends=(
  'python-setuptools'
  'python-pytest-runner'
)
checkdepends=('python-pylint')
optdepends=('python-regex')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('025d191c11abf9174c6aff0006579624047d3371a654333c4bf7a4b421552cdc')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

check() {
  cd "${_name}-${pkgver}"
  pytest
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
