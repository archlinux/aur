# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Félix Faisant <xcodexif@xif.fr>

set -u
pkgname='nopoll'
pkgver='0.4.5.b375'
pkgrel='1'
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll'
license=('LGPL')
depends=('openssl')
_verwatch=("${url}/downloads/" "nopoll-\(.*\)\.tar\.gz" 'l')
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
sha256sums=('4ecbd277714c9acd154277a46388689f9d651836ca5c69990e35d1eee8c7ceae')

build() {
  set -u
  cd "${pkgname}-${pkgver}"
  if [ ! -s 'Makefile' ]; then
    ./configure --prefix='/usr' --enable-maintainer-mode
  fi
  make -s -j1
  set +u
}

package() {
  set -u
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u
