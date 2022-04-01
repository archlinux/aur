# Maintainer  : Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer  : Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>
_pkgname='gsa'
pkgname='greenbone-security-assistant'
conflicts=('gsa')
provides=('gsa')
replaces=('gsa')
pkgver=9.0.1
pkgrel=1
pkgdesc='Greenbone Security Assistant (gsa) - OpenVAS web frontend'
url="https://github.com/greenbone/gsa"
license=('GPL')
arch=('x86_64')
depends=('libmicrohttpd' 'gvm-libs' 'libxslt')
makedepends=('cmake' 'doxygen' 'xmltoman' 'git' 'nodejs' 'yarn')
groups=('greenbone-vulnerability-manager')
backup=('etc/openvas/gsad_log.conf')
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gsa/releases/download/v${pkgver}/gsa-${pkgver}.tar.gz.sig")
sha512sums=('688bde97722f31416406e43230253c05dc8d05eb9fea6d8fd084ec4e748b67bab238f78cc11534e4fc948d911e468d43b5be0b224f17959db5e59faae7f5d086'
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
