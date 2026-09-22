# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='libstoragemgmt'
pkgver='1.11.0'
pkgrel='2'
pkgdesc='A library for storage management'
arch=('x86_64' 'aarch64')
_uri="github.com/libstorage/${pkgname}"
url="https://${_uri}"
license=('LGPL')
depends=('sqlite' 'openssl' 'libconfig' 'ledmon' 'sg3_utils' 'systemd')
makedepends=('chrpath' 'python-pywbem' 'python-six' 'procps-ng')
checkdepends=('check' 'valgrind')
optdepends=('arcconf: support for Microsemi (Adaptec) controllers'
	    'storcli: support for Broadcom (LSI) controllers')
source=("${pkgname}-${pkgver}.tar.gz::https://codeload.${_uri}/tar.gz/refs/tags/${pkgver}")
sha256sums=('9abd55b76b99bafac5448eb1b57166d2ec633ff76c929db1473c85efb900dbab')

build() {
  cd "${pkgname}-${pkgver}"
  autoreconf -fvi
  ./configure CFLAGS="${CFLAGS} ${DEBUG_CFLAGS}" \
    CXXLAGS="${CXXFLAGS} ${DEBUG_CXXFLAGS}" \
    LDFLAGS="${LDFLAGS}" \
    --prefix="/usr" \
    --bindir="/usr/bin" \
    --sbindir="/usr/bin" \
    --sysconfdir="/etc" \
    --localstatedir="/var" \
    --libdir="/usr/lib" \
    --datarootdir="/usr/share" \
    --datadir="/usr/share"
  make
}

check() {
  cd "${pkgname}-${pkgver}"
  make test
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
