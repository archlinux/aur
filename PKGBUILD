# Maintainer: Philipp Helo Rehs <P dot Rehs at gmx dot net>
# This uses modified code from package brother-mfc-l3710cw by kurtmc 
pkgname=brother-mfc-l3730cdn
pkgver=1.0.2
pkgrel=0
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3730CDN'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
makedepends=('perl' 'tar')
install='brother-mfc-l3730cdn.install'
source=('https://download.brother.com/welcome/dlf103931/mfcl3730cdnpdrv-1.0.2-0.i386.deb')
md5sums=('7bb8501ebf72bec595dadbc8b60de90d')

package() {
    ar x mfcl3730cdnpdrv-1.0.2-0.i386.deb && tar xzvf data.tar.gz

    # Patch filenames to work on Arch
    cd opt/brother/Printers/mfcl3730cdn
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3730cdn
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
