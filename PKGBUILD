# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

pkgname=gvm-tools
pkgver=25.3.0
pkgrel=1
pkgdesc='greenbone-vulnerability-manager tools'
arch=('any')
url="https://github.com/greenbone/gvm-tools"
license=('GPL-3.0-only')
depends=('python')
makedepends=(python-build python-installer python-wheel python-poetry-core)
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gvm-tools/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz.asc")
sha512sums=('d4760361b89b3164a60491c7ffa9604d427ad8bbb2e9cb284ed6a94106158ea68a35facbbe395706bd51c47d26e4c993d9232827e57723d1386859942889dc0b'
            'SKIP')
validpgpkeys=(
              'C3B468D2288C68B9D526452248479FF648DB4530' # GVM Transfer Integrity
)


build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
