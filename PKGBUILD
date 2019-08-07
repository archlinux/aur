# Maintainer: core_contingency <ccontingency at gmail dot com>
# Credit goes to Migy and his package 'brother-mfc-9332cdw' for the original 
# package, I just made minor changes.

model="9325cw"
pkgname="brother-mfc-$model"
pkgver="20190807"
pkgrel=1
lprver="1.1.2-1"
cwver="1.1.2-2"
pkgdesc="LPR and CUPS drivers for Brother MFC-9325CW"
url="https://support.brother.com/g/b/downloadtop.aspx?c=us&lang=en&prod=mfc9325cw_us_as"
arch=('i686' 'x86_64')
license=('GPL2')
install="brother-mfc-${model}.install"
depends=('lib32-libcups' 'ghostscript')
makedepends=('perl' 'a2ps')
optdepends=('brscan4: Scanner support')
source=("https://download.brother.com/welcome/dlf006466/mfc${model}lpr-${lprver}.i386.deb"
        "https://download.brother.com/welcome/dlf006468/mfc${model}cupswrapper-${cwver}.i386.deb")
sha512sums=('b3c994cce7cf96d01e5aafa3167dbe4fece78c73110b57d441d270168b4f4a76dc44932bbbd17bc425fa6c0e93aec8df980daafda42645a2119d7a043edb4c65'
            '7fccacc9fd863800c7d187f26efe0648e1a9400bc4a40c48fc6753466ea01baf1a074ee402008e1cea22edeb82bd85432ef55115898ee2ebaa353cde17d76d35')

package() {
    ar x mfc${model}lpr-${lprver}.i386.deb && tar xzvf data.tar.gz
    ar x mfc${model}cupswrapper-${cwver}.i386.deb && tar xzvf data.tar.gz

    cd opt/brother/Printers/mfc${model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model}
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
