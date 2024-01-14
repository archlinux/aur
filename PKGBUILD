# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-application
_pkgver=release-3.0.6
pkgname=python-application
pkgver=3.0.6
pkgrel=2
pkgdesc="Basic building blocks for Python applications"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-application"
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-zope-interface')
conflicts=('python3-application')
provides=('python3-application')
replaces=('python3-application')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${_pkgver}.tar.gz")
sha512sums=('854c72d50d6f06b327e6fc501bf1dfbbf8ca09c72a4c658cb4be2489e9071fe88e28c240b5e052146197fba5b313e911967fcd5cc54cdedde4b3c0253863656a')

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
