# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: mdraw.gh at gmail dot com
_base=better-exceptions
pkgname=python-${_base}
pkgver=0.3.3
pkgrel=1
pkgdesc="Pretty and helpful exceptions, automatically"
arch=(any)
url="https://github.com/Qix-/${_base}"
license=(MIT)
depends=(python)
makedepends=(python-setuptools)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('720cb657a45d5278014720a7aa309a4ee0b6dd014e6058667c09c41a5a69f319993cdb28043ab7b621008267a76fad71d36cc934eee027748db7bf8537659e66')

build() {
  cd ${_base}-${pkgver}
  export PYTHONHASHSEED=0
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
