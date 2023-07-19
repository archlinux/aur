# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.24.0.1'
_pkgver='4.24.0-1'
pkgrel='1'
pkgdesc='Mstflint - an open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'aarch64')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('a30e422eac3a163b2a8740ba5c941ba93c8788731ae7363e7beea6adc0f0bcc7')

prepare() {
  cd "${pkgname}-${_pkgver}"

  ./autogen.sh
  autoreconf -fvi

  ./configure \
    --prefix="/usr" \
    --sbindir="/usr/bin" \
    --libexecdir="/usr/lib" \
    --sysconfdir="/etc" \
    --localstatedir="/var/${pkgname}"
}

build() {
  cd "${pkgname}-${_pkgver}"
  make
}

package() {
  cd "${pkgname}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README" "${pkgdir}/usr/share/doc/${pkgname}/README"
}
