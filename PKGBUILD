# Maintainer: David Runge <dvzrv@archlinux.org>

_name=pylink-square
pkgname=python-pylink-square
pkgver=0.11.1
pkgrel=2
pkgdesc="Python interface for the SEGGER J-Link"
arch=(any)
url="https://github.com/Square/pylink"
license=(Apache)
depends=(python-future python-psutil python-six)
makedepends=(python-setuptools)
checkdepends=(python-mock python-pytest)
conflicts=(pylink)
provides=(pylink)
replaces=(pylink)
# no sdist on pypi.org: https://github.com/square/pylink/issues/119
# source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source=("${_name}-${pkgver}.tar.gz::https://github.com/square/pylink/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('ac4280dc46f112678249c7241314a28da66ffb95bc1f1eda0f4881bf80db937a32d34bb2b0433fa998f26f0a8744d7e49d5850da7d062bb3077430e7b437fdce')
b2sums=('e790e7561aa678d4f90988d9e23180fd7597393e502c2f841242ac478ea6f488f221c7e2a8239db195c1a77ff8b85778721a034cf78598338db7aff229c224bb')

build() {
  cd "pylink-$pkgver"
  python setup.py build
}

check() {
  cd "pylink-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "pylink-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 *.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
