# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: lightstream (AUR)
# Contributor: scott32 (AUR)
# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: SanskritFritz (gmail)

pkgname=spectemu
pkgver=0.99.3
pkgrel=6
pkgdesc="Fast and accurate emulator of the original 48k ZX Spectrum."
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/${pkgname}/"
license=('GPL')
depends=('libxxf86vm' 'readline')
source=("https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('ef47b553acc9436768eaa99b2b6de7d7')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix=/usr --mandir=/usr/share/man
  sed -i 's/#define size_t unsigned/\/* #define size_t unsigned *\//' "${srcdir}/${pkgname}-${pkgver}/config.h"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -j1 install_root="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
