# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Daniel Micay <danielmicay@gmail.com>

_pkgname=gsa
pkgname=greenbone-security-assistant
pkgver=23.3.0
pkgrel=2
pkgdesc='Greenbone Security Assistant (gsa) - OpenVAS web frontend'
url="https://github.com/greenbone/gsa"
license=('AGPL-3.0-only')
arch=('x86_64')
depends=('libmicrohttpd' 'gvm-libs' 'libxslt')
makedepends=('doxygen' 'npm' 'xmltoman' 'git' 'nodejs' 'yarn')
conflicts=('gsa')
provides=('gsa')
replaces=('gsa')
groups=('greenbone-vulnerability-manager')
noextract=("${_pkgname}-${pkgver}.tar.gz")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gsa/archive/v${pkgver}.tar.gz"
        "https://github.com/greenbone/gsa/releases/download/v${pkgver}/gsa-${pkgver}.tar.gz.asc")
sha512sums=('d9eaa282ba4babf3f42939f4918b5726fa539e4c4fe64e89ae77cf1887b2f10d5a97f085b168264e7b23c468f194e0c58c565ee86458812065947a4d96c43788'
            'SKIP')
validpgpkeys=('8AE4BE429B60A59B311C2E739823FAA60ED1E580') # GVM Transfer Integrity


package() {
  npm install -g --prefix "${pkgdir}/usr" "${srcdir}/${_pkgname}-${pkgver}.tar.gz"

  # Remove some cruft
  rm -rv "${pkgdir}"/usr/lib/node_modules/gsa/{.docker,.github}
}
