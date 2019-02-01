# Contributor: Felix Walter <code at felix dash walter dot eu>
# This uses modified code from package brother-mfc-9335cdw by Leo Pham <regretfulumbrella at gmail dot com>

pkgname=brother-mfc-l3750cdw
pkgver=1.0.2
pkgrel=0
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3750CDW'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
makedepends=('perl' 'tar')
install='brother-mfc-l3750cdw.install'
source=('https://download.brother.com/welcome/dlf103934/mfcl3750cdwpdrv-1.0.2-0.i386.deb')
md5sums=('ef9a24b12cc26e96b70d5cf4a1f7f6f4')

package() {
    ar x mfcl3750cdwpdrv-1.0.2-0.i386.deb && tar xzvf data.tar.gz

    # Patch filenames to work on Arch
    cd opt/brother/Printers/mfcl3750cdw
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3750cdw
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
