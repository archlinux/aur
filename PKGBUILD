# Maintainer: Anthony VanBerkum <anthonyvbop AT gmail DOT com>
pkgname=dell-s2830dn-driver
pkgver=1.0.0
pkgrel=2
pkgdesc="Driver for Dell printer S2830dn, from Dell"
url=https://www.dell.com/support/home/us/en/04/drivers/driversdetails?driverid=83ydv
arch=("any")
depends=("bash")
license=("Dell Software License Agreement")
source=("https://downloads.dell.com/FOLDER03714270M/1/Printer_S2830dn_Driver_Dell_A00_Linux.zip?uid=ca5caedc-3cd6-4795-34a8-4e09bd286c5a&fn=Printer_S2830dn_Driver_Dell_A00_Linux.zip")
sha256sums=("05d914a868ba9bf86a40bc4995c63ef40758109285995a55c344122f89d157c4")


package() {
  cd "$srcdir/Printer_S2830dn_Driver_Dell_A00_Linux/"
  uncompress -f PPD-Files-DKAER.tar.Z
  tar xf PPD-Files-DKAER.tar
  tar xf "ppd_files/foomatic/UTF-8/foomatic.tar"
  _foomatic_base="$pkgdir/usr/share/foomatic/db/source"
  mkdir -p "$_foomatic_base/"
  cp -r "driver/" "$_foomatic_base"
  cp -r "opt/" "$_foomatic_base"
  cp -r "printer/" "$_foomatic_base"
  _ppd_base="$pkgdir/usr/share/foomatic/db/source/PPD/Dell"
  mkdir -p "$_ppd_base"
  cp "ppd_files/GlobalPPD_1.4/Dell_Printer_S2830dn.ppd" "$_ppd_base"
  _filter_base="$pkgdir/usr/lib/cups/filter/"
  mkdir -p "$_filter_base"
  cp "ppd_files/GlobalPPD_1.4/fax-pnh-filter" "$_filter_base"
}
