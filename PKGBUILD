# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.0
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::http://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb")


sha512sums=('8c536ed4f3669a3759fb45d4b8f025fb72fe930702f7cbce0d17722da126002f0ea741d191f044288c0bb7eaec1c7044c912ddbc68fbfa4c5971c0c5787ddb0d')

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
 
