# Maintainer: Daniele Olivieri <danieledaniele1988@gmail.com>
# Contributor: Kevin Wells <aur@kevin.wellsie.net>

pkgname=lexmark-aex
pkgver=1
pkgrel=1
pkgdesc="CUPS printer driver for Lexmark MB2236, B2236"
arch=('x86_64')
url="http://www.lexmark.com/"
license=('custom')
depends=('cups' 'gcc-libs' 'glibc' 'ncurses' 'libusb' 'libxext' 'libxtst' 'libxi' 'krb5' 'lua' 'java-runtime')
conflicts=(lexmark-aey)
source=(https://downloads.lexmark.com/downloads/drivers/Lexmark-AEX-PPD-Files.tar.Z)
md5sums=('ea61101dda3c74a82aa91e4a46bb840c')
sha1sums=('4a33c0f5f448466ac9044002dc32839207092d64')

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
  install -Dm644 "${srcdir}/ppd_files/License_EU2-0109-en.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

