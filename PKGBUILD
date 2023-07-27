# Maintainer: Rafael Silva <perigoso@riseup.net>

_modulename='pinout'
pkgname="python-${_modulename}"
pkgver=0.0.20
pkgrel=2
pkgdesc='Generate graphical pinout references for electronic hardware.'
arch=('any')
url="https://github.com/j0ono0/${_modulename}"
license=('MIT')
depends=(
  'python'
  'python-jinja'
  'python-pillow'
)
makedepends=(
  'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/source/${_modulename::1}/${_modulename}/${_modulename}-${pkgver}.tar.gz")
b2sums=('4d6a5c00dfdaf5d8af32870791965d936cd14af926ee92e15ff77d4898331b299c57678bed45206d82a8a3d7160e78a30d51451ae2bc28751c5b548f9319e036')

build() {
  cd "${_modulename}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_modulename}-${pkgver}"

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
