# Maintainer: greyltc
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=python-pox
pkgver=0.3.4
pkgrel=1
pkgdesc="utilities for filesystem exploration and automated builds"
url="https://github.com/uqfoundation/pox"
arch=(any)
license=('BSD')
depends=('python>=3.8')
makedepends=('python-setuptools>=42.0' 'python-build' 'python-installer' 'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/uqfoundation/pox/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('03699b99ebfa1b6777572fecff84da8b887cbd90c83ed6612717e11efcf23990')

build() {
  cd "pox-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "pox-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
