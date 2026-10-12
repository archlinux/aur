# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/dptpirate/arch-ports
#
# vim: ts=2 sw=2

pkgname=mkpwd
pkgver=1.6.1
pkgrel=1
pkgdesc="Command line password generator"
arch=('x86_64' 'i686')
url='https://codeberg.org/dptpirate/mkpwd'
license=('GPL-3.0-or-later')
depends=('glibc'
         'libxcrypt')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('157439e2e6a77c60e6058c30d204903b707b14a494e71ae45251bd73c5f40a9b')

build() {
  cd "${pkgname}"
  CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}"
  make install DESTDIR="${pkgdir}"
  install -Dvm644 AUTHORS ChangeLog README \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
