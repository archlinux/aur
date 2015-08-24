# Maintainer: Mirco Tischler <mt-ml at gmx dot de>

pkgname=fwupdate
pkgver=0.4
pkgrel=2
pkgdesc='Tools for using the ESRT and UpdateCapsule() to apply firmware updates'
arch=('i686' 'x86_64')
url='https://github.com/rhinstaller/fwupdate'
license=('GPL2')
depends=('efivar' 'gnu-efi-libs')
makedepends=('pesign')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=('83ec7b2bf8d3bc37c6a60044d964503233c359150bcdb6f30e9f01ef1edd97dd')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  
  make GNUEFIDIR=/usr/lib
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make LIBDIR=/usr/lib DESTDIR="${pkgdir}" install
  
  #don't install into /boot. copy files to /usr/lib/fwupdate for manual installation
  install -d ${pkgdir}/usr/lib/fwupdate
  mv ${pkgdir}/boot/efi/EFI ${pkgdir}/usr/lib/fwupdate/EFI
  rm -rf ${pkgdir}/boot
}
