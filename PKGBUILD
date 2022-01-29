# Maintainer: Sukanka <su975853527 [AT] gmail.com>
# Maintainer: Zhong Lufan <lufanzhong@gmail.com>

pkgname=qqmusic-bin
_pkgname=qqmusic
pkgver=1.1.2
pkgrel=2
pkgdesc="tencent qq music"
arch=("x86_64")
url="https://y.qq.com/"
license=("CC0-1.0")
depends=('nss' 'libxss' 'gtk3')
provides=("$_pkgname")
source=(
    "qqmusic_${pkgver}_amd64.deb::https://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_${pkgver}_amd64.deb"
)
sha512sums=('778415898b09921a7d7071f4be92b55b4484e5bbcc5f722baff0f434bfc0cdfbbac29c412c1e5bb5ed94aa0e5f0a85d6c7913fadbbacbd04d4808b36d220d0df')

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
 
