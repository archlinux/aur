# Maintainer: shilka <shilka [AT] gmail.com>

pkgname=wind-bin
_pkgname=wind
pkgver=25.1.5.07250
pkgrel=1
pkgdesc="Wind financial terminal, 万得金融终端"
arch=("x86_64")
url="http://www.wind.com.cn"
license=("unknown")
depends=('libidn11' 'libxcrypt-compat')
provides=("$_pkgname")
install=wind-bin.install
pkgprefix="com.wind.wft-kylinV10SP1"
pkgsuffix="amd64.deb"
source=("https://d-cdn.wind.com.cn/windnet/linux/${pkgprefix}_${pkgsuffix}.zip"
         "${_pkgname}.sh")
md5sums=('4cbeea69744c665fbc8e70511b662934'
        'b91bddd9120a457da61f9f9077480ae2')

prepare(){
    cd ${srcdir}
    ar p "com.wind.wft_${pkgver}_${pkgsuffix}" data.tar.xz | tar xJf -

}
package(){

    cd $srcdir
    mkdir -p $pkgdir/opt
    cp -rf usr $pkgdir/
    cp -rf opt/apps/com.wind.wft/files   ${pkgdir}/opt/wind
    cp -rf opt/apps/com.wind.wft/entries/* ${pkgdir}/usr/share

    sed -i "s|^Exec=.*|Exec=wind|g;s|^Icon=.*|Icon=com.wind.wft|g" \
    $pkgdir/usr/share/applications/com.wind.wft.desktop

    cd ..
    install -Dm755 ./${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
}
