# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-application
_pkgver=release-3.0.7
pkgname=python-application
pkgver=3.0.7
pkgrel=1
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
sha512sums=('aca22866367318c19c04fafa75d611ccdadfffe095e650eb7dc410004654664bdd4c7e8df247284b37f6f143d1041ef354c6cb3351ce896b33ce9312815ce06e')

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
