# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=gvm-tools
pkgver=25.4.2
pkgrel=1
pkgdesc='greenbone-vulnerability-manager tools'
arch=('any')
url="https://github.com/greenbone/gvm-tools"
license=('GPL-3.0-only')
depends=('python-gvm')
makedepends=(python-build python-installer python-wheel python-poetry-core)
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gvm-tools/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('eca175611c485bd052478737bd875a7a5bf96a0fc3778bac524040dcb9a1f752696050d6455e27dacb279ae255acc649669eefdde3ea61ad02eeee5b64212075'
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
