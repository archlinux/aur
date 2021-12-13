# Maintainer: Donald Webster <fryfrog@gmail.com>
# Contributor: Sebastien Leduc <sebastien@sleduc.fr>

pkgname=python-rebulk
_name=${pkgname#python-}
pkgver=3.1.0
pkgrel=1
pkgdesc='Define simple search patterns in bulk to perform advanced matching on any string.'
arch=('any')
url='https://github.com/Toilal/rebulk'
license=('MIT')
depends=('python')
makedepends=('python-setuptools')
checkdepends=(
  'python-pylint'
  'python-pytest'
)
optdepends=('python-regex')
source=("https://pypi.org/packages/source/${_name:0:1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('809de3a97c68afa831f7101b10d316fe62e061dc9f7f67a44b7738128721173a')

prepare() {
  cd "${_name}-${pkgver}"

  # Pytest Runner not required to build
  sed -i "s/'pytest-runner'//" setup.py
}

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
  export PYTHONHASHSEED=0
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

# vim:set ts=2 sw=2 et:
