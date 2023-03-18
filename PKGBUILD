# Maintainer: Joan Bruguera Micó <joanbrugueram@gmail.com>
# Contributor: Robin McCorkell <robin@mccorkell.me.uk>

_pkgname=cryptodev-linux
pkgname=cryptodev-linux-dkms
pkgname=cryptodev-linux-dkms
pkgdesc="Kernel module providing access to Linux kernel cryptographic drivers from userspace - sources"
pkgver=1.12
pkgrel=2
url='http://cryptodev-linux.org/'
license=("GPL")
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=('dkms')
conflicts=('cryptodev_friendly')
provides=('cryptodev_friendly')
optdepends=('openssl-cryptodev: OpenSSL with cryptodev support')
source=("https://github.com/${_pkgname}/${_pkgname}/archive/${_pkgname}-${pkgver}.tar.gz"
        "dkms.conf")
sha256sums=('f51c2254749233b1b1d7ec9445158bd709f124f88e1c650fe2faac83c3a81938'
            '4c762bbea27edeb283d44af37be2faf2df21312853b200e6b93319d563f51d86')

package() {
  cd "${srcdir}/${_pkgname}-${_pkgname}-${pkgver}"
  install -d "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"
  cp -r ./* "${pkgdir}/usr/src/${_pkgname}-${pkgver}/"

  install -Dm644 "${srcdir}/dkms.conf" "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"
  sed -e "s/@PKGBASE@/${_pkgname}/" \
    -e "s/@PKGVER@/${pkgver}/" \
    -i "${pkgdir}/usr/src/${_pkgname}-${pkgver}/dkms.conf"

  install -Dm644 "crypto/cryptodev.h" "${pkgdir}/usr/include/crypto/cryptodev.h"
}
