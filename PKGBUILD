# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Jason Chu <jason@archlinux.org>
# Contributor: lightstream (AUR)
# Contributor: scott32 (AUR)
# Contributor: felmur (AUR)
# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>
# Maintainer: SanskritFritz (gmail)

pkgname=spectemu
pkgver=0.99.3
pkgrel=7
_commithash="3a666d4ad566a88afa18375a089395fc044089df"
pkgdesc="Fast and accurate emulator of the original 48k ZX Spectrum."
arch=('i686' 'x86_64')
url="https://github.com/szmi/spectemu"
license=('GPL')
depends=('libxxf86vm' 'readline')
source=("${pkgname}-${pkgver-${pkgrel}}.zip::https://github.com/szmi/spectemu/archive/$_commithash.zip")
md5sums=('11ab7dbcb144815ef3f2a58bec8568e6')

build() {
  cd "${pkgname}-${_commithash}"
  autoreconf -i
  ./configure --prefix=/usr --mandir=/usr/share/man
#   sed -i 's/#define size_t unsigned/\/* #define size_t unsigned *\//' "${srcdir}/${pkgname}-${pkgver}/config.h"
  make
}

package() {
  cd "${pkgname}-${_commithash}"
  make -j1 install_root="${pkgdir}" install
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
