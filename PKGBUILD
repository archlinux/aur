# Maintainer: zoe <chp321[at]gmail[dot]com>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
 
pkgname=python2-subprocess32
_gitname=${pkgname/python2/python}
pkgver=3.5.4
pkgrel=1
pkgdesc='Backport of the Python 3 subprocess module'
url='https://github.com/google/python-subprocess32'
arch=('x86_64')
license=('custom')
depends=('python2')
makedepends=('python2-setuptools')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/google/python-subprocess32/archive/${pkgver}.tar.gz)
sha256sums=('6686ccc657d236af7310cd7c792ca4897cfcc7344a4edb746402267ba7f436ad')
 
build() {
  cd ${_gitname}-${pkgver}
  python2 setup.py build
}
 
check() {
  cd ${_gitname}-${pkgver}
  local PYTHONVERSION="$(python2 -c 'import sys; print("{}.{}".format(sys.version_info.major, sys.version_info.minor))')"
  PYTHONPATH="build/lib.linux-${CARCH}-${PYTHONVERSION}" \
    python2 test_subprocess32.py
}
 
package() {
  cd ${_gitname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md ChangeLog -t "${pkgdir}/usr/share/doc/${pkgname}"
}
