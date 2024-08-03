# Contributor: Hans Baier <foss at hans dash baier dot de>
# This uses modified code from package brother-mfc-9335cdn by Leo Pham <regretfulumbrella at gmail dot com>

pkgname=brother-mfc-l3735cdn
pkgver=1.0.2
pkgrel=0
pkgdesc='LPR and CUPS drivers for the Brother MFC-L3735CDN'
arch=('i686' 'x86_64')
url='http://support.brother.com/g/s/id/linux/en/index.html'
license=('custom:brother' 'GPL')
depends=('cups')
makedepends=('perl' 'tar')
install='brother-mfc-l3735cdn.install'
source=('https://download.brother.com/welcome/dlf103932/mfcl3735cdnpdrv-1.0.2-0.i386.deb')
md5sums=('04ecc9ca4baf9ae9b306a459dc8fe019')

package() {
    ar x mfcl3735cdnpdrv-1.0.2-0.i386.deb && tar xzvf data.tar.gz

    # Patch filenames to work on Arch
    cd opt/brother/Printers/mfcl3735cdn
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfcl3735cdn
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
