# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: David McInnis <dave@dave3.xyz>
# Contributor: Jean Lucas <jean@4ray.co>
# Contributor: McNoggins <gagnon88 at Gmail dot com>
_base=imread
pkgname=python-${_base}
pkgdesc="Read images to numpy arrays"
pkgver=0.7.4
pkgrel=3
arch=(x86_64)
url="https://github.com/luispedro/${_base}"
license=(MIT)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel libpng libjpeg-turbo libtiff libwebp xcftools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz
  atributeerror.patch::${url}/pull/44.patch)
sha512sums=('6ec445ede6a25f57f2ab6ab3b4a89b91015edc6a73cb03124c746a21c4fcb1486abb88cf8d9980347afb4ed6b916bfd450b003ded1dc21aa1732c84472a90d28'
  'ea17959e1f481682bbd06ed40cd0f41d4b6ab3e1bcfadcc49b348f7923da620a1580e3f1b90a08a257a2cbd1b9f3b36971c547a9218b0f266bbc53f205ee6190')

prepare() {
  cd ${_base}-${pkgver}
  patch -p1 -i ../atributeerror.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING.MIT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
