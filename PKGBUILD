# Maintainer: Christian Holme (Nordwin) <hcmh [at] mailbox [dot] org>
_base=vedo
pkgname=python-${_base}
pkgver=2024.5.2
pkgrel=1
pkgdesc="Python module for scientific analysis and visualization of 3d objects"
arch=(any)
url="https://github.com/marcomusy/vedo"
license=(MIT)
depends=(python-numpy vtk)
makedepends=(python-build python-installer python-wheel python-setuptools)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('cc8f14c9a67d72c23e63c3432ff7edfd45e7da7ef65b01c73c26159ceb8be9488e06e90f5facdeb0514492ff2e0f7b566ee06dc4e2286569b62962312751c42c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --no-isolation
}


package() {
  cd ${_base}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
