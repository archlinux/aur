# Maintainer: Matthias De Bie <mattydebie@gmail.com>
# Copied https://aur.archlinux.org/packages/brother-mfc-j4910cdw/

model="j491dw"
pkgname="brother-mfc-$model"
pkgver="1.0.5"
pkgrel=1
remoteversion="1.0.5-0"
_revision=1
pkgdesc="LPR, scanner and CUPS drivers for the Brother MFC-J491DW"
url="http://support.brother.com/g/s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('perl' 'a2ps' 'lib32-libcups')
source=("https://download.brother.com/welcome/dlf103779/mfcj491dwpdrv-${remoteversion}.i386.deb")
sha256sums=('a48acde2f501a88c0d38e09983c39c072cf6da7f37d62036fc3b72ddfb15821e')
            

package() {
    ar x mfc${model}pdrv-${remoteversion}.i386.deb && tar xzvf data.tar.gz

    cd opt/brother/Printers/mfc${model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model}
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
