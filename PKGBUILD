# Contributor: Lex Black <autumn-wind@web.de>

pkgname=python-gvm
pkgver=27.0.1
pkgrel=1
pkgdesc='greenbone-vulnerability-manager tools'
arch=('any')
url="https://github.com/greenbone/python-gvm"
license=('GPL-3.0-or-later')
depends=('python-paramiko' 'python-lxml' 'python-httpx')
makedepends=(python-build python-installer python-wheel python-hatchling)
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/greenbone/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('616c795c4cc706631d1c371fb19d0a149bdf30b9c85521ce5f3eaa619ad3285f16160b2f5196f215c7938c51afba4dd1d1d3c3b6ad7e3af3d36c31ec545249db'
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
