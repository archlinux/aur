# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_pkgname='gsa'
pkgname='greenbone-security-assistant'
pkgver=23.0.0
pkgrel=1
pkgdesc='Greenbone Security Assistant (gsa) - OpenVAS web frontend'
url="https://github.com/greenbone/gsa"
license=('GPL')
arch=('x86_64')
depends=('libmicrohttpd' 'gvm-libs' 'libxslt')
makedepends=('cmake' 'doxygen' 'xmltoman' 'git' 'nodejs' 'yarn')
conflicts=('gsa')
provides=('gsa')
replaces=('gsa')
groups=('greenbone-vulnerability-manager')
backup=('etc/openvas/gsad_log.conf')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gsa/releases/download/v${pkgver}/gsa-${pkgver}.tar.gz.asc")
sha512sums=('d2dfe12777a8b7610ebc1e7eceb079d38ae1f83085c5a411c115950e55254c82151f77ce16d12342d40b457999f50348a48e66f236a83d145697f68ef9caf993'
            'SKIP')
validpgpkeys=(
              '8AE4BE429B60A59B311C2E739823FAA60ED1E580' # GVM Transfer Integrity
)
changelog=CHANGELOG.md

build() {
  cd "${_pkgname}-${pkgver}"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var . -DSBINDIR=/usr/bin
  make
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
