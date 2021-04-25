# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.0.8
pkgrel=2
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3' )
provides=("$_pkgname")
source=("qqmusic_${pkgver}_amd64.deb::http://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb")


sha512sums=('0b7603522ba4bf057b41cb3132efcd6b31d9e0a121f2b9279643ed0d9fe37e5c327e8b0b3aaa3916facf611d5e5e2d2822c80f9da2d1d221e3dedd6398e7508c')

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
 
