# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>

pkgname='python2-pyopenssl'
_name="${pkgname#python2-}"
pkgver=21.0.0
pkgrel=1
pkgdesc='Wrapper module for OpenSSL, legacy Python 2 version'
arch=('any')
url="https://pypi.org/project/${_name}/${pkgver}/"
license=('Apache')
depends=(
  'openssl'
  'python2'
  'python2-six'
  'python2-cryptography'
)
makedepends=(
  'python2-setuptools'
)
checkdepends=(
  'python2-flaky'
  'python2-pretend'
  'python2-pytest-runner'
)
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/pyca/${_name}/archive/${pkgver}.tar.gz")
sha512sums=('bad555b8b8faa60992aad779e9c9af27b132a894d4d3e59fb65f423770b31f278f5966127ca7cdcf42184cefe0c7d6fa94b84482d0e97089031e4e508d77c424')

prepare() {
  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

check() {
  (
    cd "${_tarname}"
    python2 setup.py pytest
  ) || warning "Tests failed"
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
