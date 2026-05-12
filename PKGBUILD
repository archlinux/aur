# Maintainer: shilka <shilka [AT] gmail.com>

pkgname=wind-bin
_pkgname=wind
pkgver=26.1.0.04151
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
md5sums=('0a9220750fd9b36ea8da3c3fa251dc23'
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
