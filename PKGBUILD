# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: kureta <kureta@gmail.com>
# Contributor: Renato Candido <renatocan@gmail.com>
_base=lesscpy
pkgname=python-${_base}
pkgver=0.15.1
pkgrel=1
pkgdesc="Python LESS compiler"
url="https://github.com/${_base}/${_base}"
depends=(python-ply)
makedepends=(python-setuptools)
license=(MIT)
arch=(any)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3a88c14d1e47a28d5e427e9cd0e1c2553dd3fc937085c54975c3e2612d623673e0a2fe05d7bb60dcdeda0f352b1be0354595ba9fac38483e7ab0a21529036e65')

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
