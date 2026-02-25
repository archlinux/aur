# Contributor: Lex Black <autumn-wind@web.de>

pkgname=python-gvm
pkgver=26.10.0
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
sha512sums=('dce5811742159b1b08231eb827b2753f8fedeaa23792a151b716a3006c39fe24fe318a6e1df0cfb01d71972f06c5984084784b0d7ddc326e4a599ac84fd22ca1'
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
