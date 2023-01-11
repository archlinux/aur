# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='mstflint'
pkgver='4.22.0.1'
_pkgver='4.22.0-1'
pkgrel='1'
pkgdesc='Mstflint - an open source version of MFT (Mellanox Firmware Tools)'
arch=('x86_64' 'i686')
url="https://github.com/Mellanox/${pkgname}"
license=('GPL2' 'custom:"OpenIB.org BSD"')
depends=('python' 'iniparser')
makedepends=('rdma-core')
source=("${url}/archive/v${_pkgver}/${pkgname}-${_pkgver}.tar.gz")
sha256sums=('1403928463fe589034e0effb215bbeb18e0ffac745c197b4511782f6694fe24c')

prepare() {
  cd "${srcdir}/${pkgname}-${_pkgver}"

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
  cd "${srcdir}/${pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
