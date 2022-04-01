# Maintainer  : Christian Rebischke <chris.rebischke@archlinux.org>
# Maintainer  : Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor : Daniel Micay <danielmicay@gmail.com>
pkgname=gvm-libs
pkgver=10.0.2
pkgrel=2
pkgdesc='greenbone-vulnerability-manager libraries'
arch=('x86_64')
url="https://github.com/greenbone/gvm-libs"
license=('GPL')
depends=('gnutls' 'libpcap' 'gpgme' 'libssh' 'glib2' 'libldap' 'hiredis')
makedepends=('cmake' 'doxygen')
groups=('greenbone-vulnerability-manager')
source=("https://github.com/greenbone/gvm-libs/releases/download/v${pkgver}/gvm-libs-${pkgver}.tar.gz.asc"
        "${pkgname}-${pkgver}.tar.gz::https://github.com/greenbone/gvm-libs/archive/v${pkgver}.tar.gz")
sha512sums=('SKIP'
            '276d4bf9aa68c589136f0ffaf42373c21a4b7a5aa461380cae34d722e121e7bdfcae6b1fd0eac51d24d7c67eb7f7a2ae670aad0f7847459a497739e8cce51b2e')
validpgpkeys=(
              '8AE4BE429B60A59B311C2E739823FAA60ED1E580' # GVM Transfer Integrity
)
replaces=('openvas-libraries')
changelog=CHANGELOG.md

build() {
  cd "${pkgname}-${pkgver}"
  LDFLAGS+=" -Wl,--no-as-needed"
  cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIBDIR=/usr/lib -DSYSCONFDIR=/etc -DLOCALSTATEDIR=/var .
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
  rmdir "${pkgdir}/var/run"
}
