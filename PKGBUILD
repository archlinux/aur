# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: McNoggins <gagnon88 at Gmail dot com>
_base=imread
pkgname=python-${_base}
pkgdesc="Read images to numpy arrays"
pkgver=0.7.4
pkgrel=1
arch=(any)
url="https://github.com/luispedro/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-setuptools libpng libjpeg-turbo libtiff libwebp xcftools git)
checkdepends=(python-nose)
source=("git+${url}.git?signed#tag=v${pkgver}")
sha512sums=('SKIP')
validpgpkeys=('6FB8B07A620CC7A7FB5B2AB4110D6C98E760BEF2') # Lu\xed\x73 Pedro Coelho <lpc@cmu.edu>

build() {
  cd ${_base}
  export PYTHONHASHSEED=0
  python setup.py build
}

check() {
  cd ${_base}
  python setup.py test
}

package() {
  cd ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 COPYING.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
