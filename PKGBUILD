# Contributor: Lex Black <autumn-wind@web.de>

pkgname=python-gvm
pkgver=26.9.1
pkgrel=1
pkgdesc='greenbone-vulnerability-manager tools'
arch=('any')
url="https://github.com/greenbone/python-gvm"
license=('GPL-3.0-or-later')
depends=('python-paramiko' 'python-lxml' 'python-httpx')
makedepends=(python-build python-installer python-wheel python-poetry-core)
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/greenbone/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('10cdcd6d799ae4fdbf9aed21523f6db7be6764809c3c4503f21833e87db417b4562167a89f7227b7dce94603fe339c43d7d34f9bb46ac30c31e8630a9e13d419'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # Greenbone Community Feed integrity key


build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
