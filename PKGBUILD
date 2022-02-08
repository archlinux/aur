# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.3
pkgrel=1
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3')
provides=("$_pkgname")
source=(
    "qqmusic_${pkgver}_amd64.deb::https://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb"
)
sha512sums=('1638c60fb92aee9c4bf53a6b8eea2e75b7edd366c2250106357987c3583228e98904809511c2b0216f53078c3c65ad81b6123ba72e57d14cd45afbc9f43650f8')

package(){
    cd ${srcdir}
    tar -xvf data.tar.xz -C "${pkgdir}"
    
    mkdir -p "${pkgdir}"/usr/bin
    ln -s /opt/qqmusic/qqmusic "${pkgdir}"/usr/bin/qqmusic
    cd $pkgdir/usr/share/applications/
    sed -i '3c Exec=qqmusic %U' qqmusic.desktop
    sed -i 'N;2aName[zh_CN]=QQ音乐\nKeywords=qqmusic' qqmusic.desktop
    chmod g-w -R ${pkgdir}
    sed -e 's/\xA4\x8B\x7A\xB9\x8D\xCF\x54\xAE/\xA4\x8B\x7A\xB9\x85\xEF\x54\xAE/' -i ${pkgdir}/opt/qqmusic/resources/app.asar
}
 
