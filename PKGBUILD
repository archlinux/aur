# Contributor: Felix Walter <code at felix dash walter dot eu>
# This uses modified code from package brother-mfc-9335cdw by Leo Pham <regretfulumbrella at gmail dot com>

pkgname=brother-mfc-l3770cdw
pkgver=1.0.2
pkgrel=1
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3770CDW'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
if [[ $CARCH = x86_64 ]]; then
    depends+=('lib32-expat' 'lib32-gcc-libs')
fi
makedepends=('perl' 'tar')
install='brother-mfc-l3770cdw.install'
source=('https://download.brother.com/welcome/dlf103935/mfcl3770cdwpdrv-1.0.2-0.i386.deb')
md5sums=('ec927721bea8a717940a76d09d546e95')

package() {
    ar x mfcl3770cdwpdrv-1.0.2-0.i386.deb && tar xzvf data.tar.gz

    # Patch filenames to work on Arch
    cd opt/brother/Printers/mfcl3770cdw
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3770cdw
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
