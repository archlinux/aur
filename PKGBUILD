# Maintainer: core_contingency <ccontingency at gmail dot com>
# Credit goes to Migy and his package 'brother-mfc-9332cdw' for the original 
# package, I just made minor changes.

model="7360n"
pkgname="brother-mfc-$model"
pkgver="20200123"
pkgrel=1
lprver="2.1.0-1"
cwver="2.0.4-2"
pkgdesc="LPR and CUPS drivers for Brother MFC-7360n"
url="https://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=mfc7360n_all"
arch=('i686' 'x86_64')
license=('GPL2')
install="brother-mfc-${model}.install"
depends=('lib32-libcups' 'ghostscript')
makedepends=('perl' 'a2ps')
optdepends=('brscan4: Scanner support')
source=("https://download.brother.com/welcome/dlf006237/mfc${model}lpr-${lprver}.i386.deb"
        "https://download.brother.com/welcome/dlf006239/cupswrapperMFC7360N-${cwver}.i386.deb")
sha512sums=('f3121fbe5aad77be6ebfc7425da9ffc11f65ee2eab34cece8d93c55ae6e912267d94395822af553979873d99cb5b3fe0ff119ea50e2cfb0ef4efb8d23b49cac4'
            '89c401b5e892e03f01d71f4fb64c74de98692cd5a1adced606906cdc81ddae80bf846a48d6dab157fc631cfcfd4414d4b05fe5d905de1f144f5766d4de2a6f7f')

package() {
    ar x mfc${model}lpr-${lprver}.i386.deb && tar xzvf data.tar.gz
    ar x cupswrapperMFC7360N-${cwver}.i386.deb && tar xzvf data.tar.gz

    cd usr/local/Brother/Printer/MFC7360N
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrapperMFC7360N-2.0.4
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcap2

    cp -rf $srcdir/usr/ $pkgdir/
}
