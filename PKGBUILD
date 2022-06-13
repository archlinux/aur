# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname='python2-pretend'
_name="${pkgname#python2-}"
pkgver=1.0.9
pkgrel=9
pkgdesc="A library for stubbing in Python"
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('BSD')
depends=('python2')
makedepends=('python2-setuptools')
checkdepends=('python2-pytest-runner')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/alex/pretend/archive/v$pkgver.tar.gz")
b2sums=('1a8e280fbbf147f502f1148b9e3685630e0f5cd270dc8b6fa8fbbd8177aaa08efe401a6684b669a976d828e7fcdd48d686170bfa3cd3d8a857b78af473a5b6f8')

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  cd "${_tarname}"
  python2 setup.py pytest
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
