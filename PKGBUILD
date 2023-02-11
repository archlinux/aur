# Maintainer: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>


pkgname='python2-mock'
_name="${pkgname#python2-}"
pkgver=3.0.5
pkgrel=9
pkgdesc='Mocking and patching library for testing (backport of unittest.mock) (deprecated)'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=(
  'python2'
  'python2-funcsigs'
  'python2-pbr'
  'python2-six'
  'python2-typing'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}::https://github.com/testing-cabal/${_name}/archive/${pkgver}.tar.gz")
b2sums=('b9c49b3627275889d73aff9ea9c7925093f9cafb304448b2f06eda2fff26152a031aafb4844537e4d58bc112709e59a44e08d32602776386a30d039743def29c')

prepare() {
  cd "${_tarname}"

  # use unittest instead of unittest2 as they are the same on recent python*
  sed -i 's/unittest2/unittest/g' mock/tests/*.py
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"

  python2 setup.py install --optimize=1 --root="${pkgdir}"

  install -Dm 644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
