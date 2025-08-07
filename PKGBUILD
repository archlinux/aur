# Maintainer: haxibami <contact at haxibami dot net>

pkgname=python-developer_disk_image
_pkgname=DeveloperDiskImage
pkgver=0.2.0
pkgrel=1
pkgdesc='Home for both DeveloperDiskImage files (iOS < 17.0) and Personalized files (iOS >= 17.0)'
arch=('any')
url='https://github.com/doronz88/DeveloperDiskImage'
license=('GPL-3.0-or-later')
depends=('python' 'python-requests')
makedepends=('python-build' 'python-wheel' 'python-installer' 'python-setuptools' 'python-setuptools-scm')
checkdepends=('python-pytest')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('842b5e52632c168c2c0317a446491197b8a65d8b0b936de32564444b1dc3bc6c')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
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
