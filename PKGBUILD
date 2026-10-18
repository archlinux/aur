# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=gvm-tools
pkgver=26.1.2
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
sha512sums=('af4dc0137f00f4f9059bb1ad3c229ec383f6715ae3765a109484be0a34057921590e79d8bcac405129e8477cec998a1420293955388fa68058c3817b3b95c126'
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
