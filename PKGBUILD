# Maintainer: madmack <ali@devasque.com> (up to 4.6)
# Maintainer: Andre Ericson <de.ericson@gmail.com>  (4.6+)

_pkgbase=asix
pkgname=asix-dkms
pkgver=v4.17.3
pkgrel=1
pkgdesc="Driver for USB ASIX Ethernet models AX88772C 772B 772A 760 772 178"
arch=('i686' 'x86_64')
url="http://www.asix.com.tw/"
license=('GPL')
depends=('dkms')
provides=('asix-dkms' 'asix-module')
conflicts=("asix-module")
install=${pkgname}.install
options=(!strip)
_pkgname="AX88772C_772B_772A_760_772_178_LINUX_DRIVER"
_pkgname2="Source"

source=("http://www.asix.com.tw/FrootAttach/driver/${_pkgname}_${pkgver}_${_pkgname2}.tar.gz"
        "dkms.conf"
        "asix-dkms.install")

md5sums=('5888daa63403d13e4fe3d5db498006d5'
         'fc33b5dd739e8964a346525a1434143e'
         '4160d69122622707fcbcf371e2b8bf32')

package() {

    installDir="$pkgdir/usr/src/${_pkgbase}-${pkgver}"

    install -dm755 "$installDir"
    install -m644 "$srcdir/dkms.conf" "$installDir"
    install -dm755 "$pkgdir/etc/modprobe.d"
    install -dm755 "$pkgdir/etc/modules-load.d"

        sed -e "s/@_PKGBASE@/${_pkgbase}/" \
            -e "s/@PKGVER@/${pkgver}/" \
            -i $installDir/dkms.conf

    cd "${srcdir}/${_pkgname}_${pkgver}_${_pkgname2}/"

    for d in `find . -type d`
    do
        install -dm755  "$installDir/$d"
    done

    for f in `find . -type f`
    do
        install -m644 "${srcdir}/${_pkgname}_${pkgver}_${_pkgname2}/$f" "$installDir/$f"
    done
}


