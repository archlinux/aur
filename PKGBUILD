# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-developer_disk_image
_pkgname=DeveloperDiskImage
pkgver=0.0.4
pkgrel=1
pkgdesc='Home for both DeveloperDiskImage files (iOS < 17.0) and Personalized files (iOS >= 17.0)'
arch=('any')
url='https://github.com/doronz88/DeveloperDiskImage'
license=('GPL3')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('49e3575dcec3f672b5279674613e4073057c492e08a427da90ff6fbdec9f72e7')

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
