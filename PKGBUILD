# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
_base=lxc
pkgname=python-${_base}
pkgrel=1
pkgver=5.0.0
pkgdesc="Python3 bindings for LXC"
depends=(python lxc)
makedepends=(python-setuptools)
url="https://github.com/${_base}/${pkgname/-/3-}"
license=(LGPL2)
arch=(x86_64)
source=(${url}/archive/${pkgname/-/3-}-${pkgver}.tar.gz)
sha512sums=('167ee953382e4cf4f97f21f65548ffd302b21daa46587e4ba5a66fd42a9a8c9238e2ede1b0a4c2fc0b89404c46cb4f7bd207142b8e61389cbd3363368c4fd4bb')

build() {
  cd "${pkgname/-/3-}-${pkgname/-/3-}-${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname/-/3-}-${pkgname/-/3-}-${pkgver}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
