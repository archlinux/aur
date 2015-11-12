# Author: Syed Adnan Kamili <adnan.kamili AT gmail D0T com>
# Maintainer: Marc Rozanc <marc AT rozanc D0T fr>

pkgname=flareget
_rel=4.3
_subrel=95
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
    _arch2=$_arch1
    md5sums=('285e8e59d6b488c3528b604396bf0ba5')
elif [ "${CARCH}" = "x86_64" ]; then
    _arch1="x86_64"
    _arch2="amd64"
    md5sums=('0b015603e389bfb8048ec5c07682d907')
fi

source=("http://www.flareget.com/files/flareget/rpm/${_arch2}/${pkgname}_${_rel}-${_subrel}_${_arch1}(stable)_rpm.tar.gz")

package() {
    cd $pkgdir
    rpmextract.sh "$srcdir/${pkgname}_${_rel}-${_subrel}_${_arch1}(stable)_rpm/${pkgname}-${_rel}-${_subrel}.${_arch1}.rpm"
    
    cd $srcdir
    # License
    install -Dm644 $pkgdir/usr/share/doc/$pkgname/COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
    rm $pkgdir/usr/share/doc/$pkgname/COPYING
}

