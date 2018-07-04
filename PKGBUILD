# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Félix Faisant <xcodexif@xif.fr>

set -u
pkgname='nopoll'
_pkgver='0.4.6.b400'
pkgver="${_pkgver%.*}"
pkgrel='1'
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll'
license=('LGPL')
depends=('openssl')
#_verwatch=("${url}/downloads/" "nopoll-\(.*\)\.tar\.gz" 'l')
_giturl='https://github.com/ASPLes/nopoll'
_verwatch=("${_giturl}/releases.atom" '\s\+<link rel="alternate" type="text/html" href=".*/'"${_giturl##*/}"'/releases/tag/v\?\([^"]\+\)"/>.*' 'f') # RSS
_srcdir="${pkgname}-${_pkgver}"
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
sha256sums=('7f1b20f1d0525f30cdd2a4fc386d328b4cf98c6d11cef51fe62cd9491ba19ad9')

build() {
  set -u
  cd "${_srcdir}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --enable-maintainer-mode
  fi
  make -s -j1
  set +u
}

package() {
  set -u
  cd "${_srcdir}"
  make -j1 DESTDIR="${pkgdir}/" install
  set +u
}
set +u
