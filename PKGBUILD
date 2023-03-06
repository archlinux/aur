# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.23.0.1'
_pkgver='4.23.0-1'
pkgrel='1'
pkgdesc='Mstflint - an open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'i686')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('095f75a1c50dc7328f2f933b378a3e2a63ab55d7e8495e7c881e8313b7b69c32')

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
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make
}

package() {
  cd "${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
