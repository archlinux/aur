# Maintainer: Agorgianitis Loukas < agorglouk at gmail dot com >

pkgname=rtl8723au_bt-dkms
_pkgname=${pkgname%-*}
pkgver=0.1
pkgrel=1
pkgdesc="Bluetooth driver for RTL8723AE and RTL8723AU"
arch=('any')
url="http://www.realtek.com.tw/"
license=('GPL')
depends=('dkms')
conflicts=("${_pkgname}")
makedepends=('git')
options=(!strip)
source=("$_pkgname::git+https://github.com/lwfinger/rtl8723au_bt.git"
        "void_cast.patch")
sha256sums=('SKIP' 'SKIP')

build() {
    cd "${srcdir}/${_pkgname}/"
    git checkout kernel
    patch -p1 < "${srcdir}/void_cast.patch"
    rm -fr .git* readme.txt
}

package() {
    instdir="$pkgdir/usr/src/$_pkgname-$pkgver"
    install -dm755 "$instdir"
    cp -r ${_pkgname}/* ${instdir}/
}
