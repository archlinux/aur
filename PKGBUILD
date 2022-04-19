# Maintainer: Kevin Wells <aur@kevin.wellsie.net>

pkgname=lexmark-aey
pkgver=1
pkgrel=2
pkgdesc="CUPS printer driver for Lexmark C3200 C3300 CS330 CX330 MC3200 MC3300 series"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom')
depends=('cups' 'gcc-libs' 'glibc' 'ncurses' 'libusb' 'libxext' 'libxtst' 'libxi' 'krb5' 'lua' 'java-runtime')
conflicts=()
source=(https://downloads.lexmark.com/downloads/drivers/Lexmark-AEY-PPD-Files.tar.Z)
md5sums=('2eba4fd8e8939038c8fe7aa9ba88b944')
sha1sums=('cb67bccdc245bda135847798dc5066d5cee13368')

package() {
  # The following is a rough equivalent to running the install script. It:
  # * assumes 64-bit filter binaries
  # * skips installing foomatic entries
  # * installs the ppds to a single location

  # Install PPDs
  ppd_root="usr/share/ppd"
  #ppd_root="usr/share/cups/model"
  install -Dm644 -t "${pkgdir}/${ppd_root}/Lexmark_PPD" ${srcdir}/ppd_files/GlobalPPD_1.4/*.ppd

  # Install filter scripts
  install -Dm755 -t "${pkgdir}/usr/lib/cups/filter/" "${srcdir}/ppd_files/GlobalPPD_1.4/fax-pnh-filter"
  install -Dm755 -t "${pkgdir}/usr/lib/cups/filter/" "${srcdir}/ppd_files/GlobalPPD_1.4/rerouteprintoption"

  # Install filter bins
  install -Dm755 -t "${pkgdir}/usr/lib/cups/filter/" "${srcdir}/ppd_files/GlobalPPD_1.4/lib64/CommandFileFilterG2"
  install -Dm755 -t "${pkgdir}/usr/lib/cups/filter/" "${srcdir}/ppd_files/GlobalPPD_1.4/lib64/LexHBPFilter"

  # Install license file
  install -Dm644 "${srcdir}/ppd_files/License_EU2-0111-en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
