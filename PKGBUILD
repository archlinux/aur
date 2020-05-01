# Maintainer  : Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer  : Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>

pkgname='gvmd'
pkgver=8.0.1
pkgrel=1
pkgdesc='greenbone-vulnerability-manager'
arch=('x86_64')
url="https://github.com/greenbone/gvmd"
license=('GPL')
depends=('gvm-libs' 'libical' 'python3' 'sqlite3')
makedepends=('cmake' 'doxygen' 'xmltoman')
groups=('greenbone-vulnerability-manager')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gvmd/archive/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gvmd/releases/download/v${pkgver}/gvmd-${pkgver}.tar.gz.asc")
sha512sums=('5490b902ad42499657eca9031b396c70a82d3c523985601067e697758f2472d123c4e99b085b963e58888d99224fa2a441a140772c702d7cd60d6424b126bfc8'
            'SKIP')
validpgpkeys=(
              '8AE4BE429B60A59B311C2E739823FAA60ED1E580' # GVM Transfer Integrity
)
replaces=('openvas-manager')
changelog=CHANGELOG.md

build() {
  cd "${pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DSBINDIR=/usr/bin \
    -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
