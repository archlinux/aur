model="j4910cdw"
pkgname="brother-mfc-$model"
pkgver="20140312"
pkgrel=1
lprver="3.0.1-1"
cwver="3.0.1-1"
_revision=1
pkgdesc="LPR, scanner and CUPS drivers for the Brother MFC-J4910CDW"
url="http://support.brother.com/g/s/id/linux/en/index.html"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('perl' 'a2ps' 'lib32-libcups')
source=("http://download.brother.com/welcome/dlf100750/mfc${model}lpr-${lprver}.i386.deb"
        "http://download.brother.com/welcome/dlf100752/mfc${model}cupswrapper-${cwver}.i386.deb")
sha256sums=('4653a02abe48166d7d101a49b29eaeaff176498060d1d785f212e48cabb89b10'
            '28d9321a23c0e70e7a52f8a76b17c1e30cdea59a6b6ff45356dd1ce8824b3df6')

package() {
    ar x mfc${model}lpr-${lprver}.i386.deb && tar xzvf data.tar.gz
    ar x mfc${model}cupswrapper-${cwver}.i386.deb && tar xzvf data.tar.gz

    cd opt/brother/Printers/mfc${model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model}
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
