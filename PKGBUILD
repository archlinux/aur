# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.0.9
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::http://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb")


sha512sums=('f3f7269b9f95dcd8aaa4d93ac6b6058ff846e1103a5e90049ce45a7ac93b1776d8fabb97c9540c93a94e21f5400a071f843f100654f1025bc878a1b1f4688142')

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
 
