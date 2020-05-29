# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

pkgname=cryptodev-linux
pkgver=1.10
pkgrel=1
pkgdesc="cryptodev Linux module"
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
makedepends=('linux-headers')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${pkgname}/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz"
        "https://github.com/${pkgname}/${pkgname}/commit/f971e0cd4a0ebe59fb2e8e17240399bf6901b09b.patch"
        "https://github.com/${pkgname}/${pkgname}/commit/98b163a23f6b9fbdc18c3644cf94a75cdcd0cc80.patch")
sha256sums=('833ab7c5c88d2b700a7c702a151254c089a3058886a63cc7d12630e364b8ea83'
            '66bb2786fcc5d05d5877280c797dee9a835a1ca87c5a78d400cd8310c738a4e6'
            'a536b375e59cc39119082a0cb30e8463e3df5094028652a49640e7d1baebc92f')
install=${pkgname}.install

prepare() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/f971e0cd4a0ebe59fb2e8e17240399bf6901b09b.patch"
  patch -Np1 -i "${srcdir}/98b163a23f6b9fbdc18c3644cf94a75cdcd0cc80.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgname}-${pkgver}"
  make INSTALL_MOD_PATH="${pkgdir}"/usr DESTDIR="${pkgdir}" PREFIX="${pkgdir}" install
  rm -Rf "${pkgdir}"/usr/lib/modules/*/modules.*
}
