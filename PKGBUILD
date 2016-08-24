# Maintainer: Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: Félix Faisant <xcodexif@xif.fr>

set -u
pkgname='nopoll'
pkgver='0.4.2.b297'
pkgrel='1'
pkgdesc='Websocket library written in C'
arch=('i686' 'x86_64')
url='http://www.aspl.es/nopoll'
license=('LGPL')
depends=('openssl')
_verwatch=("${url}/downloads/" "nopoll-\(.*\)\.tar\.gz" 'l')
source=("http://www.aspl.es/nopoll/downloads/nopoll-${pkgver}.tar.gz")
sha256sums=('f5fbf8aaa16a77b0f265d8c847eb06cb3e68f2b1a50737466dae81181618654c')

prepare() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr' --enable-maintainer-mode
  set +u
}

build() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s # -j "$(nproc)"
  set +u
}

package() {
  set -u
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  set +u
}
set +u
