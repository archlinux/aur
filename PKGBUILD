# Contributor: Kurt McAlpine <kurt at linux dot com>
# This uses modified code from package brother-mfc-9335cdw by Leo Pham <regretfulumbrella at gmail dot com>
pkgname=brother-mfc-l3710cw
pkgver=1.0.0
pkgrel=0
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3710CW'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
makedepends=('perl' 'tar')
install='brother-mfc-l3710cw.install'
source=('https://download.brother.com/welcome/dlf103930/mfcl3710cwpdrv-1.0.2-0.i386.deb')
md5sums=('3c9df04884b75b7116adb3a0a7916c80')

package() {
    ar x mfcl3710cwpdrv-1.0.2-0.i386.deb && tar xzvf data.tar.gz

    # Patch filenames to work on Arch
    cd opt/brother/Printers/mfcl3710cw
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3710cw
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
