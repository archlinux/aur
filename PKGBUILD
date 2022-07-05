# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=6.4.1
pkgrel=1
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL3)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-setuptools)
optdepends=('python-goocalendar: calendar support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('7725b68901daf3b516fae99b8291e47a41c59298454bd759d58a11d6d9c550091e601f1a84ce94c508e334737ef078338412e7537a64728af728c332408da1d0')
provides=(${_base})
conflicts=(${_base})

build() {
  cd ${_base}-${pkgver}
  python setup.py build
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 ${_base}/data/pixmaps/${_base}/${_base}-icon.png "${pkgdir}/usr/share/pixmaps/${_base}-icon.png"
}
