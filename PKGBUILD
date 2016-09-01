# Author: Syed Adnan Kamili <adnan.kamili AT gmail D0T com>
# Maintainer: Marc Rozanc <marc AT rozanc D0T fr>

pkgname=flareget
_rel=4.4
_subrel=100
pkgver=${_rel}.${_subrel}
pkgrel=1
pkgdesc="A full featured, advanced, multi-threaded, multisegment download manager and accelerator."
arch=('i686' 'x86_64')
url="http://flareget.com"
license=('custom')
depends=('glibc>=2.13' 'qt4>=4.8.1' 'libmetalink')
makedepends=('rpmextract')
install=${pkgname}.install
backup=('etc/opt/chrome/native-messaging-hosts/com.flareget.flareget.json')
noextract=("${pkgname}-${_rel}-${_subrel}.${_arch1}.rpm")

if  [ "${CARCH}" = "i686" ]; then
    _arch1="i386"
elif [ "${CARCH}" = "x86_64" ]; then
    _arch1="x86_64"
fi

source_i686=("https://www.flareget.com/downloads/files/flareget/rpm/i386/${pkgname}-${_rel}-${_subrel}.i386.rpm")
source_x86_64=("https://www.flareget.com/downloads/files/flareget/rpm/amd64/${pkgname}-${_rel}-${_subrel}.x86_64.rpm")
sha256sums_i686=("33a02d6617c9c63551f0e2588f5a044330190cc1f3c0ef9c4d04fb8df2dac330")
sha256sums_x86_64=("595fe78c1d60aa4e5e087619ba8c99e573a9293cbbf9332c57bcccacfc85081d")

package() {
    cd $pkgdir
    rpmextract.sh "$srcdir/${pkgname}-${_rel}-${_subrel}.${_arch1}.rpm"
    
    cd $srcdir
    # License
    install -Dm644 $pkgdir/usr/share/doc/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
    rm $pkgdir/usr/share/doc/$pkgname/COPYING
}

