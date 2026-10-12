# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Upstream: https://codeberg.org/dptpirate/arch-ports
#
# vim: ts=2 sw=2

pkgname=bas
pkgver=2.7
pkgrel=1
pkgdesc="A BASIC interpreter"
arch=('x86_64' 'i686')
url="http://www.moria.de/~michael/bas/"
license=('MIT')
depends=('glibc'
         'ncurses')
source=("${url}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('07e9c47f6cdf8eed9ac8a885dcd7d98c53b12471da996fa7f6bf135a5736783c')

prepare() {
  cd "${pkgname}-${pkgver}"
  CFLAGS="${CFLAGS}" LDFLAGS="${LDFLAGS}" ./configure --prefix=/usr
}

build() {
  cd "${pkgname}-${pkgver}"
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make install prefix="${pkgdir}/usr"
  install -Dvm0644 NEWS README -t "${pkgdir}/usr/share/doc/${pkgname}/"
  install -Dvm0644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
