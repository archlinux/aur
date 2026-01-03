# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-application
_pkgver=release-3.0.9
pkgname=python-application
pkgver=3.0.9
pkgrel=1
pkgdesc="Basic building blocks for Python applications"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-application"
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=(
  'python>=3.13'
  'python-zope-interface'
)
conflicts=('python3-application')
provides=('python3-application')
replaces=('python3-application')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${_pkgver}.tar.gz")
sha512sums=('7c9d05b72b9e22c0ef09c0b2f36304d1ace9136016c83c2679bb34fee001bbf4a3bf3d50c31cb56bb4e2c096f5cc559093040eb281dc0dded118375923ec674e')

prepare() {
  cd "${_pkgname}-${_pkgver}"
}

build() {
  cd "${_pkgname}-${_pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${_pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
