# Contributor: Lex Black <autumn-wind@web.de>

pkgname=python-gvm
pkgver=26.11.1
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
sha512sums=('5023556bf333fc31862cd42dff9eaa99aefd48d9807dbcf694c7699e113c61aff9861fe7f761da991e74924c20adb984e96dd8587bf522a739fbb4b27ca6b58d'
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
