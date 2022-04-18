# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor : mok <mok at ethetricks dot eu>

set -u
pkgname='ike-scan'
pkgver='1.9.5'
pkgrel='1'
pkgdesc='A tool that uses IKE protocol to discover, fingerprint and test IPSec VPN servers'
arch=('i686' 'x86_64')
#url="http://www.nta-monitor.com/tools/${pkgname}/"
url="https://github.com/royhills/${pkgname}/archive/refs/tags"
license=('GPL')
depends=('openssl')
_srcdir="${pkgname}-${pkgver}"
#_verwatch=('http://www.nta-monitor.com/tools-resources/security-tools/ike-scan-archive' ".*${pkgname}-\([0-9\.]\+\)\.tar\.gz" 'l')
#source=("${url}download/${pkgname}-${pkgver}.tar.gz")
#_verwatch=("${url}/releases" "${url#*github.com}/releases/download/.*/${pkgname}-\(.*\)\.tar\.gz" 'l')
source=("${_srcdir}.tar.gz::${url}/${pkgver}.tar.gz")
md5sums=('c72010d37f75642adcc0ec7d001fe1c5')
sha256sums=('5152bf06ac82d0cadffb93a010ffb6bca7efd35ea169ca7539cf2860ce2b263f')

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'configure' ]; then
    autoreconf --install
  fi
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --mandir='/usr/share/man' --with-openssl
  fi
  make -s
  set +u
}

check() {
  set -u
  cd "${_srcdir}"
  make check
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -s DESTDIR="${pkgdir}" install
  set +u
}
set +u
