# Maintainer: daprussiaduck <fairytail28wius at gmail dot com>
# Modified from : 'brother-mfc-7360n' at https://aur.archlinux.org/packages/brother-mfc-7360n to work with
# the Brother MFC 6490CW

model="6490cw"
pkgname="brother-mfc-$model"
pkgver="20250115"
pkgrel=1
lprver="1.1.2-2"
cwver="1.1.2-2"
pkgdesc="LPR and CUPS drivers for Brother MFC-6490CW printer"
url="https://support.brother.com/g/b/downloadlist.aspx?c=us&lang=en&prod=mfc${model}_all&os=128"
arch=('i686' 'x86_64')
license=('GPL2')
install="brother-mfc-${model}.install"
depends=('lib32-libcups' 'ghostscript')
makedepends=('perl' 'a2ps' 'gcc')
optdepends=('brscan3: Scanner support')
source=("https://download.brother.com/welcome/dlf006180/mfc${model}lpr-${lprver}.i386.deb"
        "https://download.brother.com/welcome/dlf006182/mfc${model}cupswrapper-${cwver}.i386.deb")
sha512sums=('8e98bc8db5e87cb3698580eac9339c2c980a1bc578a1faf58b87a0a7692a61edd75a025f6405a8bbd3da8548ef5a07aac2dd5b6c48b7d025a770fb7a4e46a1c0'
            '7e9888de7ef00697dd914c75e403f1c87d43377241d0f7828220a7d3e5af54ae4cd7d3c0a7bf15ca37376293797e4de75018b158920530bb2bdc96615d75e71d')

package() {
    ar x mfc${model}lpr-${lprver}.i386.deb && tar xzvf data.tar.gz
    ar x mfc${model}cupswrapper-${cwver}.i386.deb && tar xzvf data.tar.gz

    cd usr/local/Brother/Printer/mfc${model}
    perl -i -pe 's#/etc/init.d#/etc/rc.d#g' ./cupswrapper/cupswrappermfc${model}
    perl -i -pe 's#printcap\.local#printcap#g' ./inf/setupPrintcapij

    cp -rf $srcdir/usr/ $pkgdir/
}
