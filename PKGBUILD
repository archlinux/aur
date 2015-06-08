# Maintainer: Pedro Gabriel Drumond Pereira (pedrogabriel)

pkgname=wd719x-firmware
pkgver=1
pkgrel=1
pkgdesc="Driver for Western Digital WD7193, WD7197 and WD7296 SCSI cards"
url="http://support.wdc.com/product/download.asp?groupid=801&sid=27&lang=en"
license=('unknown')
makedepends=('lha')
arch=('any')
conflicts=()
replaces=()
backup=()
md5sums=('c5f7dc52c96e606e403751a4c482d785')
source=('http://support.wdc.com/download/archive/pciscsi.exe')
noextract=('pciscsi.exe')

build() {
        lha xi pciscsi.exe pci-scsi.exe
        lha xi pci-scsi.exe nt/wd7296a.sys
        dd if=wd7296a.sys of=wd719x-risc.bin bs=1 skip=5760 count=14336
        dd if=wd7296a.sys of=wd719x-wcs.bin bs=1 skip=20096 count=514
}

package() {
        install -Dm644 $srcdir/wd719x-risc.bin $pkgdir/usr/lib/firmware/wd719x-risc.bin
        install -Dm644 $srcdir/wd719x-wcs.bin $pkgdir/usr/lib/firmware/wd719x-wcs.bin
}

