# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : mok <mok at ethetricks dot eu>

set -u
pkgname='ike-scan'
pkgver='1.9'
pkgrel='3'
pkgdesc='A tool that uses IKE protocol to discover, fingerprint and test IPSec VPN servers'
arch=('i686' 'x86_64')
#url="http://www.nta-monitor.com/tools/${pkgname}/"
url="https://github.com/royhills/${pkgname}"
license=('GPL')
depends=('openssl')
#_verwatch=('http://www.nta-monitor.com/tools-resources/security-tools/ike-scan-archive' ".*${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
#source=("${url}download/${pkgname}-${pkgver}.tar.gz")
_verwatch=("${url}/releases" "${url#*github.com}/releases/download/.*/${pkgname}-\(.*\)\.tar\.gz" 'l')
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('05d15c7172034935d1e46b01dacf1101a293ae0d06c0e14025a4507656f1a7b6')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --mandir='/usr/share/man' --with-openssl
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s DESTDIR="${pkgdir}" install
  set +u
}
set +u
