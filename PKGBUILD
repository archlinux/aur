# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_pkgname=python3-gnutls
pkgname=python-gnutls
pkgver=3.1.10
_pkgver=release-3.1.10
pkgrel=2
pkgdesc="GnuTLS bindings for Python"
license=('LGPL-2.1+')
arch=('aarch64' 'x86_64')
url="https://github.com/AGProjects/python3-gnutls"
makedepends=('python-build' 'python-installer' 'python-wheel')
depends=('python' 'python-twisted' 'gnutls')
conflicts=('python3-gnutls')
provides=('python3-gnutls')
replaces=('python3-gnutls')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/AGProjects/${_pkgname}/archive/${_pkgver}.tar.gz")
sha512sums=('15e1d9a73b5c80bf5b978a9eb463c751a259ee712dee7e7cb88cb6a8cb133c5d1b62f5f96a0c4520ddd24a64a3a144ce353d45cd451311f36ad9365033ddde20')

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
