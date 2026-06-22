# Contributor: Lex Black <autumn-wind@web.de>

pkgname=python-gvm
pkgver=27.4.0
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
sha512sums=('6fe7b8e2dafcb3047c2e43ce7bbcf6684eaa138c929d4d78376e19fd47006580286571fe491112fd420f700e6b2dfe3bdac3a23abf0db1e90b53588730c0753a'
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
