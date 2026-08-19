# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=gvm-tools
pkgver=26.1.0
pkgrel=1
pkgdesc='greenbone-vulnerability-manager tools'
arch=('any')
url="https://github.com/greenbone/gvm-tools"
license=('GPL-3.0-only')
depends=('python-gvm')
makedepends=(python-build python-installer python-wheel python-hatchling)
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gvm-tools/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('5f5c3b42287802160128742ec852a84e0801e44ef675745e48fc63c3de59b9df306072d415e8f534be041b4eceb28339b561ca51c5f0d0c2f4d0c00089ec5242'
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
