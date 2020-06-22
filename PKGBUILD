# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
# Maintainer: Sukanka <su975853527 [AT] gmail.com>

pkgname='powerword-bin'
pkgver=1.2
pkgrel=2
pkgdesc="A Chinese-English dictionary tool."
arch=('x86_64')
license=('unknown')
url="http://www.iciba.com"
provides=("powerword")
depends=('sdl2_mixer' 'qtwebkit' 'ffmpeg' 'qrencode')
optdepends=('ttf-ms-fonts: font support')
source=("${pkgname}.deb::https://cdn-package-store6.deepin.com/appstore/pool/appstore/c/com.kingsoft.powerword/com.kingsoft.powerword_${pkgver}_amd64.deb"
        "powerword.install")
md5sums=('8712bbccce4ff5eebc7f04d2c250a581'
         '2f1a949dad8635177f2fbb8fbb887cd8')
install=powerword.install

package() {
    cd ${srcdir}
    tar -xJvf data.tar.xz -C "${pkgdir}"
    
    mkdir -p "${pkgdir}"/usr/share/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/entries/* "${pkgdir}"/usr/share/
    sed -i 's|/opt/apps/com.kingsoft.powerword/entries/|/usr/share/|g' "${pkgdir}"/usr/share/applications/com.kingsoft.powerword.desktop
    sed -i 's|/opt/apps/com.kingsoft.powerword/files/|/usr/bin/|g' "${pkgdir}"/usr/share/applications/com.kingsoft.powerword.desktop
    
    mkdir -p "${pkgdir}"/usr/bin/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/Powerword "${pkgdir}"/usr/bin/Powerword
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/mp3player "${pkgdir}"/usr/bin/mp3player
    
    # data should be moved to ~/.config/com.kingsoft.powerword/resources manually
    mkdir -p "$pkgdir"/tmp/
    chmod -R 0775 "${pkgdir}"/tmp/
    mv "${pkgdir}"/opt/apps/com.kingsoft.powerword/files/resources "$pkgdir"/tmp
    
    # remove unused batch files.
    find "$pkgdir"/tmp/resources -name "*.bat"  | xargs rm -f
    
    rm -r "${pkgdir}"/opt
} 
