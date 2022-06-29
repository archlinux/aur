# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=wind-bin
_pkgname=wind
pkgver=22.2.0.4
pkgrel=1
pkgdesc="Wind financial terminal, 万得金融终端"
arch=("x86_64")
url="http://www.wind.com.cn"
license=("unknown")
depends=('libidn11')
provides=("$_pkgname")
install=wind-bin.install
source=("https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.wind.wft/com.wind.wft_${pkgver}_amd64.deb"
"${_pkgname}.sh"
)


sha512sums=('f4464b2cae430611e913193a787160ef36adfd98c9202948140ad16a6ba175644bfe33b69ddd2109699ce06d2eb33ae28a92f3282264ef00ee5a2b8929e72ff7'
            'ccfa9c937df21012337c07dbcd8cbba977cb6cdad4e701d8396c260bc0876cd94d1bf57a8fd6b8dfac901c47bd4448f99232169bb3d10f49b16616caa7cc43a4')

prepare(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${srcdir}"

}
package(){
    cd $srcdir
    mkdir -p $pkgdir/opt
    cp -rf usr $pkgdir/
    cp -rf opt/apps/com.wind.wft/files   ${pkgdir}/opt/wind
    cp -rf opt/apps/com.wind.wft/entries/* ${pkgdir}/usr/share
    
    sed -i "s|^Exec=.*|Exec=wind|g;s|^Icon=.*|Icon=com.wind.wft|g" \
    $pkgdir/usr/share/applications/com.wind.wft.desktop
    
    install -Dm755 "${_pkgname}.sh" ${pkgdir}/usr/bin/${_pkgname}
}
 
