# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.0
pkgrel=2
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::https://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb")


sha512sums=('09a33b25e2ab688d1286e1a0e6d21fcad5212498296401b5a4ed435457d62523dfab628bfc71bfd2dca23ff4658dec3d920ebff5e11a81a952c3339a14088be7')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    mv ${pkgdir}/opt/QQmusic   ${pkgdir}/opt/qqmusic
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    cd $pkgdir/usr/share/applications/
    sed -i '3c Exec=qqmusic %U'       qqmusic.desktop 
#     sed -i '7c StartupWMClass=qqmusic'  qqmusic.desktop
    sed -i 's|QQmusic|qqmusic|g'        qqmusic.desktop 
    sed -i 'N;2aName[zh_CN]=QQ音乐'      qqmusic.desktop 
}
 
