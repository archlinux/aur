model="9332cdw"
pkgname="brother-mfc-$model"
pkgver="20170302"
pkgrel=3
lprver="1.1.3-0"
cwver="1.1.4-0"
pkgdesc="LPR and CUPS drivers for Brother MFC-9332CDW"
url="https://support.brother.com/g/b/downloadlist.aspx?c=de&lang=de&prod=mfc9332cdw_eu&os=128&flang=English"
arch=('i686' 'x86_64')
license=('unknown')
install="brother-mfc-${model}.install"
depends=('perl' 'a2ps' 'libcups')
optdepends=('brscan4: Scanner support')
source=("http://download.brother.com/welcome/dlf101620/mfc${model}lpr-${lprver}.i386.deb"
        "http://download.brother.com/welcome/dlf101621/mfc${model}cupswrapper-${cwver}.i386.deb")
sha512sums=('78c84b107333457afaa3b12b8e3c89067c68150ca6d0d6e5df6414c56e55faca99038bf8b6937213ce925aade2d3142b738efea784893ff0e1ab1d1d7d9c1021'
            'd0a5eb28962613649831f2d5f54a61196394f6a8c256826c813af073363881e8ab86b31c23a64c95c2ed1c1f4ca6b7bf3f25c6bc7d6ff4eaa7948e18369fc482')

package() {
    ar x mfc${model}lpr-${lprver}.i386.deb && tar xzvf data.tar.gz
    ar x mfc${model}cupswrapper-${cwver}.i386.deb && tar xzvf data.tar.gz

    cd opt/brother/Printers/mfc${model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model}
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
    cp -rf $srcdir/opt/ $pkgdir/
}
