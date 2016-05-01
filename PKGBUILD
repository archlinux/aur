# Maintainer: Nicola Bignami <nicola@kernel-panic.no-ip.net>

pkgbase="foomatic-db-foo2zjs"
pkgname=('foomatic-db-foo2zjs')
arch=('any')
pkgver=20160502
pkgrel=1
epoch=3

makedepends=('cups' 'perl' 'libxml2' 'enscript' 'perl' 'net-snmp' 'bash')
url="http://www.linuxprinting.org/foomatic.html"
options=('!emptydirs' '!strip')
 
source=(foomatic-db-${pkgver}.tar.xz::http://www.openprinting.org/download/foomatic/foomatic-db-current.tar.xz)
sha256sums=('SKIP')

_removed_files=(
	driver/foo2hiperc.xml
	driver/foo2hp.xml
	driver/foo2lava.xml
	driver/foo2oak-z1.xml
	driver/foo2oak.xml
	driver/foo2qpdl.xml
	driver/foo2slx.xml
	driver/foo2xqx.xml
	driver/foo2zjs.xml
	driver/foo2hbpl2.xml
	driver/foo2zjs-z1.xml
	driver/foo2zjs-z2.xml
	driver/foo2zjs-z3.xml
	printer/HP-LaserJet_1000.xml
	printer/HP-LaserJet_1005.xml
	printer/HP-LaserJet_1018.xml
	printer/HP-LaserJet_1020.xml
	printer/HP-LaserJet_1022.xml
	printer/HP-LaserJet_M1005_MFP.xml
	printer/HP-LaserJet_1022n.xml
	printer/HP-LaserJet_1022nw.xml
	printer/HP-LaserJet_P1005.xml
	printer/HP-LaserJet_P1006.xml
	printer/HP-LaserJet_P1007.xml
	printer/HP-LaserJet_P1008.xml
	printer/HP-Color_LaserJet_1500.xml
	printer/HP-Color_LaserJet_1600.xml
	printer/HP-Color_LaserJet_2600n.xml
	printer/HP-Color_LaserJet_CP1215.xml
	printer/HP-LaserJet_M1120_MFP.xml
	printer/HP-LaserJet_M1319_MFP.xml
	printer/HP-LaserJet_P1505.xml
	printer/HP-LaserJet_P1505n.xml
	printer/HP-LaserJet_P2014.xml
	printer/HP-LaserJet_P2014n.xml
	printer/HP-LaserJet_P2035.xml
	printer/HP-LaserJet_P2035n.xml
	printer/HP-LaserJet_Pro_CP1025nw.xml
	printer/HP-LaserJet_Pro_P1102.xml
	printer/HP-LaserJet_Pro_P1102w.xml
	printer/HP-LaserJet_Pro_P1566.xml
	printer/HP-LaserJet_Pro_P1606dn.xml
	printer/Minolta-magicolor_2200_DL.xml
	printer/Minolta-magicolor_2300_DL.xml
	printer/Minolta-magicolor_2430_DL.xml
	printer/KONICA_MINOLTA-magicolor_2430_DL.xml
	printer/KONICA_MINOLTA-magicolor_2480_MF.xml
	printer/KONICA_MINOLTA-magicolor_2490_MF.xml
	printer/KONICA_MINOLTA-magicolor_2530_DL.xml
	printer/KONICA_MINOLTA-magicolor_1680MF.xml
	printer/KONICA_MINOLTA-magicolor_1690MF.xml
	printer/KONICA_MINOLTA-magicolor_4690MF.xml
	printer/KONICA_MINOLTA-magicolor_1600W.xml
	printer/Kyocera-KM-1635.xml
	printer/Kyocera-KM-2035.xml
	printer/Xerox-Phaser_6110.xml
	printer/Xerox-Phaser_6115MFP.xml
	printer/Xerox-Phaser_6121MFP.xml
	printer/Xerox-WorkCentre_6015.xml
	printer/Fuji_Xerox-DocuPrint_CM205.xml
	printer/Samsung-CLP-300.xml
	printer/Samsung-CLP-310.xml
	printer/Samsung-CLP-315.xml
	printer/Samsung-CLP-325.xml
	printer/Samsung-CLP-365.xml
	printer/Samsung-CLP-600.xml
	printer/Samsung-CLP-610.xml
	printer/Samsung-CLP-620.xml
	printer/Samsung-CLX-2160.xml
	printer/Samsung-CLX-3160.xml
	printer/Samsung-CLX-3175.xml
	printer/Samsung-CLX-3185.xml
	printer/Generic-OAKT_Printer.xml
	printer/Generic-ZjStream_Printer.xml
	printer/Lexmark-C500.xml
	printer/Minolta-Color_PageWorks_Pro_L.xml
	printer/Oki-C110.xml
	printer/Oki-C301dn.xml
	printer/Oki-C310dn.xml
	printer/Oki-C3100.xml
	printer/Oki-C3200.xml
	printer/Oki-C3300.xml
	printer/Oki-C3400.xml
	printer/Oki-C3530_MFP.xml
	printer/Oki-C5100.xml
	printer/Oki-C5200.xml
	printer/Oki-C5500.xml
	printer/Oki-C5600.xml
	printer/Oki-C5650.xml
	printer/Oki-C5800.xml
	printer/Dell-1355.xml
	printer/Olivetti-d-Color_P160W.xml
)

pkgver() {
  date "+%Y%m%d"
}

prepare(){
  rm -rf foomatic-db
  mv -v foomatic-db-*[0-9] foomatic-db

  # for gutenprint printers, use gutenprint-ijs-simplified.5.2.
  perl -pi -e 's,>gutenprint<,>gutenprint-ijs-simplified.5.2<,' foomatic-db/db/source/printer/*.xml
}

build() {
  # foomatic-db
  pushd foomatic-db
  ./make_configure
  ./configure --prefix=/usr \
    --disable-gzip-ppds \
    --disable-ppds-to-cups \
    --with-drivers=NOOBSOLETES,NOEMPTYCMDLINE
  popd
}

package_foomatic-db-foo2zjs() {

 _pkgname=foomatic-db
 pkgdesc="Foomatic - The collected knowledge about printers, drivers, and driver options in XML files, used by foomatic-db-engine to generate PPD files. Files replaced by foo2zjs are removed from this package."
 license=('GPL' 'custom')
 optdepends=('foomatic-db-ppds: PostScript PPD files')
 conflicts=('foomatic-db')
 provides=('foomatic-db' 'foomatic-db-hpijs')

   cd ${srcdir}/foomatic-db
   make DESTDIR=${pkgdir} install
   
   # add some docs
   install -Dm644 USAGE ${pkgdir}/usr/share/doc/${_pkgname}/USAGE
   install -Dm644 README ${pkgdir}/usr/share/doc/${_pkgname}/README
   install -v -Dm644 ${srcdir}/${_pkgname}/COPYING ${pkgdir}/usr/share/licenses/${_pkgname}/COPYING
   install -Dm644 ${pkgdir}/usr/share/foomatic/db/source/PPD/Kyocera/ReadMe.htm ${pkgdir}/usr/share/doc/${_pkgname}/Kyocera/ReadMe.htm
   # remove files from foomatic-db-ppds pkg
   rm -rf ${pkgdir}/usr/share/cups/model/foomatic-db-ppds
   rm -rf ${pkgdir}/usr/share/foomatic/db/source/PPD
   # remove files provided by foo2zjs
   cd ${pkgdir}/usr/share/foomatic/db/source
   rm -vf "${_removed_files[@]}"
}
