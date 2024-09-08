# Contributor: Bernhard Jaud <itsme+aur at genuineparts dot org>
# This uses modified code from package brother-mfc-9335cdn by Leo Pham <regretfulumbrella at gmail dot com>

pkgname=brother-mfc-l3760cdw
pkgver=3.5.1
pkgrel=0
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3760CDW'
arch=('i686' 'x86_64')
options=('!debug')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
if [[ $CARCH = x86_64 ]]; then
    depends+=('lib32-expat' 'lib32-gcc-libs')
fi
makedepends=('perl' 'tar')
install='brother-mfc-l3760cdw.install'
source=('https://download.brother.com/welcome/dlf105762/mfcl3760cdwpdrv-3.5.1-1.i386.deb')
md5sums=('a5fb3394dc1b7f0b9aec16ffdbaf5100')

package() {
    ar x mfcl3760cdwpdrv-3.5.1-1.i386.deb && tar xzvf data.tar.gz

    # Patch filenames to work on Arch
    cd opt/brother/Printers/mfcl3760cdw
    #perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3760cdw
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/opt/ $pkgdir/
}
