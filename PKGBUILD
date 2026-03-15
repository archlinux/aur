# Maintainer: BrainwreckedTech <bwt at bwt dot com dot de>

pkgname=rongta-label-printer-cups
pkgver=1.1.3
pkgrel=1
pkgdesc='Rongta Label Printer CUPS PPD drivers'
# Arch only matters for the rastertortlabel CUPS filter
arch=(aarch64 loongarch64 x86 x86_64)
url='https://pt.rongtatech.com/category/downloads/1_2'
# Licensing is not explicitly stated by Rongta.
# The filter driver is most likely proprietary.
# The PPD files *might* be Apache-2.0
license=(custom)
depends=(cups ghostscript)
# I've only been able to find this driver on the PT and CN web sites.
# www.rongtatech.com (presumably US) does not have the Linux CUPS drivers.
# The CN web site's ZIP file has Chinese characters in the top dir name.
source=('rtpd.zip::https://pt.rongtatech.com/uploadfile/downloads/Label%20Printer%20Driver%20(Linux&Chinese%20domestic%20system).zip')
sha256sums=('303cce9ccf5ecb36c844947e6c16cd456a0040d561ed73d00198f4683de18654')

# This is just an abuse of arrays to document compatible models.
compat=(ACEV1S ACEM1  RI460 RP211  RP212   RP215  RP216  RP216   RP310
        RP310D RP311  RP400 RP400A RP400H  RP410  RP410C RP410N  RP410Y
        RP411  RP415  RP420 RP421  RP421A  RP422  RP425  RP500   RP500A
        RP8    RP80VI RP810 RPF412 RPP04   RPP30  RPP320 RPP320N RPP322 RPW210)

package() {
  # The top-level directory name in the ZIP file uses non-standard characters.
  # Use a glob to rename it to confines of the typeable US latin alphabet.
  mv Label* "Label Printer Driver"
  dirname="Label Printer Driver/RTLabel_LinuxDriver_v${pkgver}"
  install -D -m755 -t ${pkgdir}/usr/lib/cups/filter "${dirname}"/filter/${CARCH}/rastertortlabel
  install -D -m644 -t ${pkgdir}/usr/share/ppd/rongta "${dirname}"/ppd/*
  # Yes, they freaking misspelled Label after correctly spelling it elsewhere
  install -D -m644 -t ${pkgdir}/usr/share/doc/rongta "${dirname}"/RTLableLinuxGuide_English.pdf
}
