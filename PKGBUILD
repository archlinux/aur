# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-developer_disk_image
_pkgname=DeveloperDiskImage
pkgver=0.0.2
pkgrel=1
pkgdesc='Home for both DeveloperDiskImage files (iOS < 17.0) and Personalized files (iOS >= 17.0)'
arch=('any')
url='https://github.com/doronz88/DeveloperDiskImage'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1ed1d921916f9f86a3cbe939017c1ca3f858554a0d8f156f87fbc617fa086505')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m pytest
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
