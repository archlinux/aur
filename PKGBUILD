# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Richard PALO <richard.palo@free.fr>
_base=tryton
pkgname=python-${_base}
pkgver=7.8.0
pkgrel=1
pkgdesc="Tryton desktop client"
arch=(any)
url="https://${_base}.org"
license=(GPL-3.0-or-later)
depends=(python-cairo python-dateutil python-gobject)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-goocalendar: calendar support'
  'python-playsound: sound support')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('3ec098c9c13d905069961b9bbc7bf25ae4a73af6f6bb7c34efa1f9dc24516e07fd8018a0535e1ef1e32bf36ba9c2bdde60c95e38d24949412d9a3707ae89e28d')
provides=(${_base})
conflicts=(${_base})

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 ${_base}.desktop -t "${pkgdir}/usr/share/applications"
  install -Dm 644 ${_base}/data/pixmaps/${_base}/${_base}-icon.png -t "${pkgdir}/usr/share/pixmaps"
}
