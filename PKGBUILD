# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://git.metalpunks.info/arch-ports
#
# vim: ts=2 sw=2

pkgname=mpck
pkgver=0.21
pkgrel=4
pkgdesc="Reads MP3 files and tries to determine if they are correct"
arch=('x86_64' 'i686')
url='https://checkmate.gissen.nl'
license=('GPL-2.0-or-later')
depends=('glibc')
source=("${url}/checkmate-${pkgver}.tar.gz")
sha256sums=('a27b4843ec06b069a46363836efda3e56e1daaf193a73a4da875e77f0945dd7a')

build() {
  cd checkmate-${pkgver}
  CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --prefix=/usr
  make
}

package() {
  cd checkmate-${pkgver}
  make install prefix="${pkgdir}/usr"
  install -Dvm644 AUTHORS HISTORY NEWS README.md TODO \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
